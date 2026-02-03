import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';
import 'package:renter_pay/features/auth/widgets/verification_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload.dart';

class DocumentVerification extends GetView<DocumentVerificationController> {
  const DocumentVerification({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesPath.appLogo, height: 30.h, width: 170.w),
            SizedBox(height: 20.h),
            CustomTextPrimary(text: "Verification", fontSize: 28.sp),
            SizedBox(height: 7.h),
            CustomTextPrimary(
              text:
                  "Upload a government-issued ID (such as National ID,\nDriving License, or Passport) for identity verification.",
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20.h),
            CustomDropdownMenu(
              onSelect: (value) {
                controller.selectedDocument.value = value ?? 'NID';
              },
              option: const ['NID', 'Passport'],
              isSelect: controller.selectedDocument,
            ),
            SizedBox(height: 20.h),
            Obx(() {
              final frontImage = controller.frontImage.value;
              return frontImage != null
                  ? CustomDottedBorder(image: FileImage(File(frontImage.path)))
                  : DocumentUpload(
                      titleText: 'Front Side',
                      onTap: () {
                        UploadImage.pickDocument(
                          type: 'front',
                          frontImage: controller.frontImage,
                          backImage: controller.backImage,
                          picker: controller.picker,
                        );
                      },
                    );
            }),
            SizedBox(height: 20.h),
            Obx(() {
              final backImage = controller.backImage.value;
              return backImage != null
                  ? CustomDottedBorder(image: FileImage(File(backImage.path)))
                  : DocumentUpload(
                      titleText: 'Back Side (Optional)',
                      onTap: () {
                        UploadImage.pickDocument(
                          type: 'back',
                          frontImage: controller.frontImage,
                          backImage: controller.backImage,
                          picker: controller.picker,
                        );
                      },
                    );
            }),
            SizedBox(height: 24.h),
            VerificationButton(),
          ],
        ),
      ),
    );
  }
}
