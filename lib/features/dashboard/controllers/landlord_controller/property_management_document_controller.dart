import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/property_document_repo.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class PropertyManagementDocumentController extends GetxController {
  final PropertyDocumentRepository propertyDocumentRepository;
  PropertyManagementDocumentController({
    required this.propertyDocumentRepository,
  });
  RxList<XFile> landImage = <XFile>[].obs;
  RxList<XFile> insuranceImage = <XFile>[].obs;
  RxList<XFile> electricalImage = <XFile>[].obs;
  RxList<XFile> signImage = <XFile>[].obs;
  RxList<XFile> plumbingImage = <XFile>[].obs;
  RxBool isLoading = false.obs;

  /// Document type definitions
  static const String typeOwnershipCertificate = 'ownership_certificate';
  static const String typeInsurance = 'insurance';
  static const String typeElectricalCompliance = 'electrical_compliance';
  static const String typePlumbingCompliance = 'plumbing_compliance';
  static const String typeOther = 'other';

  /// All available document types with display labels
  final List<Map<String, String>> documentTypes = const [
    {
      'key': typeOwnershipCertificate,
      'label': 'Land Data Registry Certificate',
    },
    {'key': typeInsurance, 'label': 'Certificate of Landlord Insurance'},
    {
      'key': typeElectricalCompliance,
      'label': 'Electrical Compliance Certificate',
    },
    {'key': typePlumbingCompliance, 'label': 'Plumbing Compliance Certificate'},
    {'key': typeOther, 'label': "Owner's signed declaration"},
  ];

  /// Currently selected document types from dropdown
  RxList<String> selectedDocumentTypes = <String>[].obs;

  /// Get display label for a document type key
  String getDocumentLabel(String key) {
    final match = documentTypes.where((e) => e['key'] == key);
    return match.isNotEmpty ? match.first['label']! : key;
  }

  /// Get image list for a document type key
  RxList<XFile> getImageList(String key) {
    switch (key) {
      case typeOwnershipCertificate:
        return landImage;
      case typeInsurance:
        return insuranceImage;
      case typeElectricalCompliance:
        return electricalImage;
      case typePlumbingCompliance:
        return plumbingImage;
      case typeOther:
        return signImage;
      default:
        throw ArgumentError('Unknown document type: $key');
    }
  }

  /// Toggle a document type selection
  void toggleDocumentType(String key) {
    if (selectedDocumentTypes.contains(key)) {
      selectedDocumentTypes.remove(key);
    } else {
      selectedDocumentTypes.add(key);
    }
  }

  /// Remove a specific document type from selection
  void removeDocumentType(String key) {
    selectedDocumentTypes.remove(key);
  }

  /// Check if a document type is selected
  bool isDocumentTypeSelected(String key) {
    return selectedDocumentTypes.contains(key);
  }

  Future<void> submitDocument({
    required String documentType,
    required List<XFile> images,
  }) async {
    isLoading.value = true;
    final response = await propertyDocumentRepository.execute(
      documentType: documentType,
      images: images.map((e) => File(e.path)).toList(),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        SuccessSnackbar.show(description: '$documentType Uploaded');
      },
    );
  }

  Future<dynamic> openDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return SuccessDialog(
          title1: 'Property Documents Verified',
          subtitle: 'You can update your property information now.',
          button: CustomPrimaryButton(
            onPressed: () {
              Get.offNamed(AppRoutes.mainHome);
            },
            text: 'Back To Home',
            height: 40.h,
            width: 259.w,
            borderRadius: BorderRadius.circular(6.r),
          ),
        );
      },
    );
  }
}
