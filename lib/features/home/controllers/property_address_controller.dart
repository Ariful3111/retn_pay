import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/models/property_address_model.dart';
import 'package:renter_pay/features/home/repositories/property_address_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PropertyAddressController extends GetxController {
  final PropertyAddressRepository propertyAddressRepository;
  PropertyAddressController({required this.propertyAddressRepository});

  RxBool isLoading = false.obs;
  TextEditingController addressController = TextEditingController();

  PropertyAddress? _selectedAddress;
  final suggestions = <PropertyAddress>[].obs;

  bool _suppressListener = false;
  Timer? _debounce;
  String _lastQueryText = '';

  @override
  void onInit() {
    super.onInit();
    addressController.addListener(_onAddressTextChanged);
  }

  @override
  void onClose() {
    _debounce?.cancel();
    addressController.removeListener(_onAddressTextChanged);
    addressController.dispose();
    super.onClose();
  }

  void _onAddressTextChanged() {
    if (_suppressListener) return;
    final query = addressController.text;
    if (query == _lastQueryText) return;
    _lastQueryText = query;
    _selectedAddress = null;
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      _debounce?.cancel();
      clearSuggestions();
      return;
    }
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      getPropertyAddresses(query: query);
    });
  }

  Future<void> getPropertyAddresses({required String query}) async {
    try {
      isLoading.value = true;
      final response = await propertyAddressRepository.execute(
        query: query.trim(),
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
          suggestions.assignAll(const []);
        },
        (data) {
          suggestions.assignAll(data.data ?? const []);
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  String addressDisplayText(PropertyAddress address) {
    return [
      address.address,
      address.city,
      address.state,
    ].whereType<String>().where((s) => s.trim().isNotEmpty).join(', ');
  }

  String suggestionTitle(PropertyAddress address) {
    final full = address.fullAddress?.trim();
    if (full != null && full.isNotEmpty) return full;
    return addressDisplayText(address);
  }

  void clearSuggestions() {
    suggestions.assignAll(const []);
  }

  void selectAddress(PropertyAddress address) {
    _selectedAddress = address;
    _suppressListener = true;
    addressController.text = addressDisplayText(address);
    addressController.selection = TextSelection.fromPosition(
      TextPosition(offset: addressController.text.length),
    );
    _suppressListener = false;
    _lastQueryText = addressDisplayText(address);
    clearSuggestions();
  }

  (String?, String?, String?) extractFilterInfos() {
    final address = _selectedAddress;
    if (address == null) {
      return (null, null, null);
    }
    return (address.city, address.state, address.postalCode);
  }

  void resetFilters() {
    _selectedAddress = null;
    addressController.clear();
    clearSuggestions();
  }
}
