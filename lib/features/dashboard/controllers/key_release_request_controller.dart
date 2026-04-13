import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/repositories/key_release_request_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';
import 'package:signature/signature.dart';

class KeyReleaseRequestController extends GetxController {
  final KeyReleaseRequestRepository repository;
  KeyReleaseRequestController({required this.repository});

  // Common
  RxBool isLoading = false.obs;
  RxString signatureMode = 'draw'.obs;
  RxBool isDrawing = false.obs;
  RxString typedText = ''.obs;
  TextEditingController drawController = TextEditingController();
  SignatureController? signatureController;

  // Landlord form fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxString selectedState = ''.obs;
  TextEditingController zipCodeController = TextEditingController();
  Rx<DateTime?> releaseDate = Rx<DateTime?>(null);

  // Items list for landlord
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  void initSignatureController(bool isDark) {
    signatureController = SignatureController(
      penStrokeWidth: 3,
      penColor: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF1A1A2E),
    );
  }

  // Add new item
  void addItem() {
    items.add({
      'keyImages': <XFile>[],
      'roomDoorName': TextEditingController(),
      'releaseDate': Rx<DateTime?>(null),
    });
  }

  // Remove item
  void removeItem(int index) {
    if (items.length > 1) {
      items[index]['roomDoorName'].dispose();
      items.removeAt(index);
    }
  }

  // Validate tenant
  bool validateTenant() {
    if (signatureController == null || signatureController!.isEmpty) {
      ErrorSnackbar.show(description: "Please provide signature");
      return false;
    }
    return true;
  }

  // Validate landlord
  bool validateLandlord() {
    if (firstNameController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter resident first name");
      return false;
    }
    if (lastNameController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter resident last name");
      return false;
    }
    if (addressLine1Controller.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter address");
      return false;
    }
    if (cityController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter city");
      return false;
    }
    if (selectedState.value.isEmpty) {
      ErrorSnackbar.show(description: "Please select state");
      return false;
    }
    if (zipCodeController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter zip code");
      return false;
    }
    if (releaseDate.value == null) {
      ErrorSnackbar.show(description: "Please select release date");
      return false;
    }
    if (items.isEmpty) {
      ErrorSnackbar.show(description: "Please add at least one key item");
      return false;
    }
    for (var item in items) {
      if ((item['keyImages'] as List).isEmpty) {
        ErrorSnackbar.show(description: "Please add key image for all items");
        return false;
      }
      if (item['roomDoorName'].text.isEmpty) {
        ErrorSnackbar.show(description: "Please enter room/door name");
        return false;
      }
      if (item['releaseDate'].value == null) {
        ErrorSnackbar.show(description: "Please select date for all items");
        return false;
      }
    }
    if (signatureController == null || signatureController!.isEmpty) {
      ErrorSnackbar.show(description: "Please provide signature");
      return false;
    }
    return true;
  }

  // Submit tenant signature
  Future<void> submitTenant({required int leaseAgreementId}) async {
    if (!validateTenant()) return;

    isLoading.value = true;
    final signatureBase64 = await _getSignatureBase64();
    if (signatureBase64 == null) {
      isLoading.value = false;
      ErrorSnackbar.show(description: "Failed to process signature");
      return;
    }

    final response = await repository.submitTenantSignatureBase64(
      leaseAgreementId: leaseAgreementId,
      residentSignatureBase64: signatureBase64,
      residentSignatureType: signatureMode.value,
    );

    isLoading.value = false;
    response.fold((error) => ErrorSnackbar.show(description: error.message), (
      _,
    ) {
      SuccessSnackbar.show(description: "Signature submitted successfully");
      Get.back();
    });
  }

  // Submit landlord key release
  Future<void> submitLandlord({required int leaseAgreementId}) async {
    if (!validateLandlord()) return;

    isLoading.value = true;
    final signatureBase64 = await _getSignatureBase64();
    if (signatureBase64 == null) {
      isLoading.value = false;
      ErrorSnackbar.show(description: "Failed to process signature");
      return;
    }

    final keyReleaseItems = await _prepareItems();
    if (keyReleaseItems == null) {
      isLoading.value = false;
      ErrorSnackbar.show(description: "Failed to process images");
      return;
    }

    final response = await repository.submitLandlordKeyRelease(
      leaseAgreementId: leaseAgreementId,
      residentFirstName: firstNameController.text,
      residentLastName: lastNameController.text,
      landlordAgentSignature: signatureBase64,
      landlordAgentSignatureType: signatureMode.value,
      releaseDate: _formatDate(releaseDate.value!),
      items: keyReleaseItems,
    );

    isLoading.value = false;
    response.fold((error) => ErrorSnackbar.show(description: error.message), (
      _,
    ) {
      SuccessSnackbar.show(description: "Key release submitted successfully");
      Get.back();
    });
  }

  Future<String?> _getSignatureBase64() async {
    if (signatureMode.value == 'type') {
      return 'data:text/plain;base64,${Uri.encodeComponent(typedText.value)}';
    }
    final bytes = await signatureController!.toPngBytes();
    if (bytes == null) return null;
    return 'data:image/png;base64,${base64Encode(bytes)}';
  }

  Future<List<KeyReleaseItem>?> _prepareItems() async {
    final list = <KeyReleaseItem>[];
    for (var item in items) {
      final images = item['keyImages'] as List<XFile>;
      if (images.isEmpty) continue;
      list.add(
        KeyReleaseItem(
          keyImage: File(images.first.path),
          roomDoorName: item['roomDoorName'].text,
          releaseDate: _formatDate(item['releaseDate'].value),
        ),
      );
    }
    return list.isEmpty ? null : list;
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  void reset() {
    isLoading.value = false;
    signatureMode.value = 'draw';
    isDrawing.value = false;
    typedText.value = '';
    drawController.clear();
    signatureController?.clear();
    firstNameController.clear();
    lastNameController.clear();
    addressLine1Controller.clear();
    addressLine2Controller.clear();
    cityController.clear();
    selectedState.value = '';
    zipCodeController.clear();
    releaseDate.value = null;
    for (var item in items) {
      item['roomDoorName'].dispose();
    }
    items.clear();
  }

  @override
  void onClose() {
    drawController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    for (var item in items) {
      item['roomDoorName'].dispose();
    }
    super.onClose();
  }
}
