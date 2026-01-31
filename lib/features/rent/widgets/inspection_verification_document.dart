import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/rent/controllers/upload_document_controller.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload.dart';

class InspectionVerificationDocument
    extends GetWidget<UploadDocumentController> {
  const InspectionVerificationDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImagesPath.appLogo, height: 30.h, width: 174.37.w),
        SizedBox(height: 12.h),
        CustomTextSecondary(
          text:
              'As this is your first time submitting an\ninspection request, please provide your ID/ Driving license/ Passport to continue.',
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
              ? GestureDetector(
                  onTap: () {
                    UploadImage.pickDocument(
                      type: 'front',
                      frontImage: controller.frontImage,
                      backImage: controller.backImage,
                      picker: controller.picker,
                    );
                  },
                  child: CustomDottedBorder(
                    height: 201.h,
                    width: 312.w,
                    image: FileImage(File(frontImage.path)),
                  ),
                )
              : DocumentUpload(
                  titleText: 'Front Image',
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
        SizedBox(height: 21.46.h),
        Obx(() {
          final backImage = controller.backImage.value;
          return backImage != null
              ? GestureDetector(
                  onTap: () {
                    UploadImage.pickDocument(
                      type: 'front',
                      frontImage: controller.frontImage,
                      backImage: controller.backImage,
                      picker: controller.picker,
                    );
                  },
                  child: CustomDottedBorder(
                    height: 201.h,
                    width: 312.w,
                    image: FileImage(File(backImage.path)),
                  ),
                )
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
      ],
    );
  }
}
