import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/create_property_repo.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/features/home/models/property_category_model.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class AddNewPropertyController extends GetxController {
  final CreatePropertyRepository createPropertyRepository;
  AddNewPropertyController({required this.createPropertyRepository});
  RxBool isNewProperty = false.obs;
  RxBool isPropertyDetails = false.obs;
  TextEditingController imageDescriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController featureController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedProperty = ''.obs;
  RxList<bool> inspectionChecked = <bool>[false, false].obs;
  RxList<int> selectedFeature = <int>[].obs;
  RxList<XFile> images = <XFile>[].obs;
  RxList<XFile> vrImages = <XFile>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingAddProperty = false.obs;

  RxString selectedAgent = ''.obs;
  List<String> agentList = ['Ariful', 'Rafi', 'Shanto'];
  List<String> inspectionType = ['In-Person Inspection', 'Virtual Tour'];
  RxList<String> featureList = <String>[].obs;
  final storage = Get.find<StorageService>();

  void addFeature() {
    final value = featureController.text.trim();
    if (value.isEmpty) return;
    featureList.add(value);
    featureController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  PropertyCategory? _getSelectedCategory() {
    final categories =
        Get.find<PropertyCategoryController>().propertyCategories.value?.data;
    if (categories == null) return null;

    final selected = selectedProperty.value.trim();
    if (selected.isEmpty) return null;

    for (final c in categories) {
      if (c.name == selected ||
          c.slug == selected ||
          c.id?.toString() == selected) {
        return c;
      }
    }
    return null;
  }

  bool _validate() {
    final errors = <String>[];

    final name = nameController.text.trim();
    final description = descriptionController.text.trim();
    final address = address1Controller.text.trim();
    final city = cityController.text.trim();
    final state = stateController.text.trim();
    final postalCode = postalCodeController.text.trim();
    final unitName = unitController.text.trim();

    if (name.isEmpty) errors.add('Name required');
    if (description.isEmpty) errors.add('Description required');
    if (address.isEmpty) errors.add('Address required');
    if (city.isEmpty) errors.add('City required');
    if (state.isEmpty) errors.add('State required');
    if (postalCode.isEmpty) errors.add('Postal Code required');

    final category = _getSelectedCategory();
    if (category?.id == null) errors.add('Property Type required');
    if ((category?.slug ?? '').trim().isEmpty) errors.add('type required');
    final isUnitType =
        (category?.slug ?? '').trim().toLowerCase() == 'unit' ||
        (category?.slug ?? '').trim().toLowerCase() == 'units' ||
        (category?.name ?? '').trim().toLowerCase() == 'unit' ||
        (category?.name ?? '').trim().toLowerCase() == 'units';
    if (isUnitType && unitName.isEmpty) {
      errors.add('Unit Name required');
    }

    final bedText = bedController.text.trim();
    final bathText = bathController.text.trim();
    final bed = int.tryParse(bedText);
    final bath = int.tryParse(bathText);
    if (bedText.isEmpty || bed == null) errors.add('Bedroom required');
    if (bathText.isEmpty || bath == null) errors.add('Bathroom required');

    final rentText = rentController.text.trim();
    final rent = double.tryParse(rentText);
    if (rentText.isEmpty || rent == null) errors.add('Rent required');

    if (images.isEmpty) errors.add('Image required');

    final hasInspectionSelected =
        inspectionChecked.isNotEmpty &&
        inspectionChecked.any((checked) => checked == true);
    if (!hasInspectionSelected) {
      errors.add('Inspection required');
    }

    if (errors.isNotEmpty) {
      ErrorSnackbar.show(description: errors.first);
      return false;
    }
    return true;
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    await Get.find<PropertyCategoryController>().getPropertyCategories();
    await Get.find<PropertyAmenitiesController>().getPropertyAmenities();
    isLoading.value = false;
  }

  Future<void> addProperty() async {
    isLoadingAddProperty.value = true;
    try {
      if (!_validate()) return;

      final category = _getSelectedCategory()!;

      final bed = int.tryParse(bedController.text.trim());
      final bath = int.tryParse(bathController.text.trim());
      final rent = double.tryParse(rentController.text.trim());
      final unitSize = double.tryParse(areaController.text.trim());
      final unitNumber = unitController.text.trim();

      final response = await createPropertyRepository.execute(
        title: nameController.text.trim(),
        description: descriptionController.text.trim(),
        features: featureList.toList(),
        address: address1Controller.text.trim(),
        propertyTypeID: category.id!,
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        type: category.slug!.trim(),
        bedroom: bed,
        bathroom: bath,
        status: 'active',
        amenities: selectedFeature.toList(),
        isInPerson: inspectionChecked.isNotEmpty && inspectionChecked[0] == true
            ? 1
            : 0,
        isVirtual: inspectionChecked.length > 1 && inspectionChecked[1] == true
            ? 1
            : 0,
        unitNUmber: unitNumber.isNotEmpty ? unitNumber : null,
        rent: rent,
        currency: 'AUD',
        unitBedroom: bed,
        unitBathroom: bath,
        unitSize: unitSize,
        images: images.map((e) => File(e.path)).toList(),
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) async {
          isPropertyDetails.value = !isPropertyDetails.value;
          await storage.write(
            key: storage.propertyIDKey,
            value: data.data?.id?.toInt() ?? 0,
          );
          Get.back();
          for (final position
              in Get.find<PropertyManagementController>()
                  .propertyScrollController
                  .positions) {
            position.animateTo(
              position.minScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
      );
    } finally {
      isLoadingAddProperty.value = false;
    }
  }

  @override
  void onClose() {
    imageDescriptionController.dispose();
    areaController.dispose();
    nameController.dispose();
    unitController.dispose();
    rentController.dispose();
    bedController.dispose();
    bathController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    descriptionController.dispose();
    featureController.dispose();
    dateController.dispose();
    stateController.dispose();
    images.clear();
    vrImages.clear();
    super.onClose();
  }
}
