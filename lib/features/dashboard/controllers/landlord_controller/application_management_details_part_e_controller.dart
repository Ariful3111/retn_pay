import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class ApplicationManagementDetailsPartEController extends GetxController {
  // Is editable flag - true for new application, false for viewing existing
  RxBool isEditable = true.obs;

  // Existing signature from API (base64)
  RxString existingSignature = ''.obs;

  // Method to set existing signature
  void setExistingSignature(String signature) {
    existingSignature.value = signature;
  }

  // Method to check if signature exists (either new or from API)
  bool get hasSignature => existingSignature.value.isNotEmpty;

  TextEditingController applicantNameController = TextEditingController();
  TextEditingController applicantAddressController = TextEditingController();
  TextEditingController applicantPostcodeController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController businessHourController = TextEditingController();
  TextEditingController afterHourController = TextEditingController();
  TextEditingController applicationEmailController = TextEditingController();
  TextEditingController dependentsNumberController = TextEditingController();
  TextEditingController dependentsAgeController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController otherIncomeController = TextEditingController();
  TextEditingController previousProviderNameController =
      TextEditingController();
  TextEditingController previousProviderPhoneController =
      TextEditingController();
  TextEditingController previousProviderEmailController =
      TextEditingController();
  TextEditingController currentEmployerNameController = TextEditingController();
  TextEditingController currentEmployerAddressController =
      TextEditingController();
  TextEditingController currentEmployerPostcodeController =
      TextEditingController();

  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();

  TextEditingController positionController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController remarksController = TextEditingController();
  TextEditingController previousEmployerNameController =
      TextEditingController();
  TextEditingController previousEmployerAddressController =
      TextEditingController();
  TextEditingController previousEmployerPostcodeController =
      TextEditingController();

  TextEditingController previousYearsController = TextEditingController();
  TextEditingController previousMonthsController = TextEditingController();

  TextEditingController previousPositionController = TextEditingController();
  TextEditingController previousContactPersonController =
      TextEditingController();
  TextEditingController previousPhoneController = TextEditingController();

  TextEditingController previousRemarksController = TextEditingController();
  TextEditingController ref1NameController = TextEditingController();
  TextEditingController ref1RelationController = TextEditingController();
  TextEditingController ref1HomePhoneController = TextEditingController();
  TextEditingController ref1WorkPhoneController = TextEditingController();
  TextEditingController ref2NameController = TextEditingController();
  TextEditingController ref2RelationController = TextEditingController();
  TextEditingController ref2HomePhoneController = TextEditingController();
  TextEditingController ref2WorkPhoneController = TextEditingController();

  RxInt employmentType = 0.obs;
  List<String> employmentTypeOptions = ['Full-time', 'Part-time', 'Casual'];

  /// PETS
  RxInt petType = 0.obs;
  List<String> petOptions = ['No', 'Yes'];
  TextEditingController petDetailsController = TextEditingController();

  /// SIGNATURE
  SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );

  /// DATE
  TextEditingController dateController = TextEditingController();

  @override
  void onClose() {
    applicantNameController.dispose();
    applicantAddressController.dispose();
    applicantPostcodeController.dispose();
    previousProviderNameController.dispose();
    previousProviderPhoneController.dispose();
    previousProviderEmailController.dispose();
    currentEmployerNameController.dispose();
    currentEmployerAddressController.dispose();
    currentEmployerPostcodeController.dispose();
    yearsController.dispose();
    monthsController.dispose();
    positionController.dispose();
    contactPersonController.dispose();
    phoneController.dispose();
    remarksController.dispose();
    previousEmployerNameController.dispose();
    previousEmployerAddressController.dispose();
    previousEmployerPostcodeController.dispose();
    previousYearsController.dispose();
    previousMonthsController.dispose();
    previousPositionController.dispose();
    previousContactPersonController.dispose();
    previousPhoneController.dispose();
    previousRemarksController.dispose();
    occupationController.dispose();
    ref1NameController.dispose();
    ref1RelationController.dispose();
    ref1HomePhoneController.dispose();
    ref1WorkPhoneController.dispose();
    ref2NameController.dispose();
    ref2RelationController.dispose();
    ref2HomePhoneController.dispose();
    ref2WorkPhoneController.dispose();
    petDetailsController.dispose();
    dateController.dispose();
    signatureController.dispose();
    super.onClose();
  }
}
