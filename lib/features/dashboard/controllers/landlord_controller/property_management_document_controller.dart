import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
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
              Navigator.pop(context);
              Get.find<PropertyManagementController>().isViewProperty.value =
                  false;
              Get.find<AddNewPropertyController>().isPropertyDetails.value =
                  false;
              Get.find<AddNewPropertyController>().isNewProperty.value = false;
              Get.find<PropertyManagementController>().propertyScrollController
                  .jumpTo(
                    Get.find<PropertyManagementController>()
                        .propertyScrollController
                        .position
                        .minScrollExtent,
                  );
            },
            text: 'Back to Property Management',
            height: 40.h,
            width: 259.w,
            borderRadius: BorderRadius.circular(6.r),
          ),
        );
      },
    );
  }
}
