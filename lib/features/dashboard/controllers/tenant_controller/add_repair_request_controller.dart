import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/add_repair_request_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class AddRepairRequestController extends GetxController {
  final AddRepairRequestRepository addRepairRequestRepository;
  AddRepairRequestController({required this.addRepairRequestRepository});
  RxBool isLoading = false.obs;
  RxList<XFile> repairImages = <XFile>[].obs;
  final List requestType = <String>['Urgent', 'Non-Urgent'];
  RxInt selectedIndex = 0.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController issueTitleController = TextEditingController();
  TextEditingController issueDetailsController = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final List timePeriodList = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    '',
  ];
  RxInt checkboxIndex = 0.obs;
  RxBool isCheck = false.obs;

  void reset() {
    isLoading.value = false;
    repairImages.clear();
    selectedIndex.value = 0;
    checkboxIndex.value = 0;
    isCheck.value = false;
    selectedDate.value = null;
    dateController.clear();
    timeController.clear();
    issueTitleController.clear();
    issueDetailsController.clear();
  }

  Future<void> addRepairRequest() async {
    if (issueTitleController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter title");
      return;
    }
    if (issueDetailsController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please enter description");
      return;
    }
    if (selectedDate.value == null) {
      ErrorSnackbar.show(description: "Please select date");
      return;
    }
    if (checkboxIndex.value == 3 && timeController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please select time");
      return;
    }
    if (repairImages.isEmpty) {
      ErrorSnackbar.show(description: "Please add images");
      return;
    }
    isLoading.value = true;
    final preferredDate = selectedDate.value!
        .toIso8601String()
        .split('T')
        .first;
    final urgency = selectedIndex.value == 0 ? 'urgent' : 'non-urgent';
    final preferredTime = switch (checkboxIndex.value) {
      0 => '8am_12pm',
      1 => '12pm_5pm',
      2 => 'after_5pm',
      _ => null,
    };
    final otherPreferredTime = checkboxIndex.value == 3
        ? timeController.text
        : null;
    final response = await addRepairRequestRepository.execute(
      propertyID:
          Get.find<LeaseAgreementController>()
              .leaseAgreements
              .value
              ?.data
              ?.data
              ?.first
              .propertyId ??
          0,
      unitID:
          Get.find<LeaseAgreementController>()
              .leaseAgreements
              .value
              ?.data
              ?.data
              ?.first
              .propertyUnitId ??
          0,
      title: issueTitleController.text,
      description: issueDetailsController.text,
      urgency: urgency,
      preferredDate: preferredDate,
      preferredTime: preferredTime,
      otherPreferredTime: otherPreferredTime,
      images: repairImages.map((e) => File(e.path)).toList(),
    );
    isLoading.value = false;

    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        SuccessSnackbar.show(description: "Repair request added successfully");
        Get.back();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    timeController.dispose();
    issueDetailsController.dispose();
    issueTitleController.dispose();
  }
}
