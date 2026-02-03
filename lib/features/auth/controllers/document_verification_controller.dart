import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/rent/repositories/upload_document_repo.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class DocumentVerificationController extends GetxController {
  final UploadDocumentRepository uploadDocumentRepository;
  DocumentVerificationController({required this.uploadDocumentRepository});

  ImagePicker picker = ImagePicker();
  RxString selectedDocument = 'NID'.obs;
  Rxn<XFile> frontImage = Rxn<XFile>();
  Rxn<XFile> backImage = Rxn<XFile>();
  RxBool isLoading = false.obs;

  Future<void> uploadDocument({required BuildContext context}) async {
    if (frontImage.value == null) {
      ErrorSnackbar.show(description: "Please select front image");
    } else {
      isLoading.value = true;
      List<File> images = [];
      List<String> imageParameters = [];
      images.add(File(frontImage.value!.path));
      imageParameters.add("file");
      if (backImage.value != null) {
        images.add(File(backImage.value!.path));
        imageParameters.add("back_file");
      }
      final response = await uploadDocumentRepository.execute(
        imageParameters: imageParameters,
        images: images,
        documentType: selectedDocument.value.toLowerCase(),
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return SuccessDialog(
                button: CustomPrimaryButton(
                  height: 40.h,
                  width: 172.w,
                  borderRadius: BorderRadius.circular(6.sp),
                  onPressed: () {
                    int index =
                        Get.find<UserRoleController>().selectedIndex.value;
                    if (index == 1 || index == 3) {
                      Get.toNamed(AppRoutes.subsPlan);
                    }
                  },
                  text: "Back To Dashboard",
                ),
              );
            },
          );
        },
      );
    }
  }
}
