import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload.dart';

class InspectionVerificationDocument extends StatelessWidget {
  const InspectionVerificationDocument({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyViewController propertyViewController = Get.find();
    return Column(
      children: [
        Image.asset(ImagesPath.appLogo, height: 30.h, width: 174.37.w),
              SizedBox(height: 12.h),
              CustomTextSecondary(
                text:
                    'As this is your first time submitting an\ninspection request, please provide your ID/ Driving license/ Passport to continue.',
              ),
              SizedBox(height: 24.h),
              Obx(() {
                final frontImage = propertyViewController.frontImage.value;
                return frontImage != null
                    ? CustomDottedBorder(
                        height: 201.h,
                        width: 312.w,
                        image:FileImage(File(frontImage.path)) ,
                      )
                    : DocumentUpload(
                        titleText: 'Front Image',
                        onTap: () {
                          UploadImage.pickDocument(
                            type: 'front',
                            frontImage: propertyViewController.frontImage,
                            backImage: propertyViewController.backImage,
                            picker: propertyViewController.picker,
                          );
                        },
                      );
              }),
              SizedBox(height: 21.46.h),
              Obx(() {
                final backImage = propertyViewController.backImage.value;
                return backImage != null
                    ? CustomDottedBorder(
                        height: 201.h,
                        width: 312.w,
                        image:FileImage(File(backImage.path)) ,
                      )
                    : DocumentUpload(
                        titleText: 'Back Side (Optional)',
                        onTap: () {
                          UploadImage.pickDocument(
                            type: 'back',
                            frontImage: propertyViewController.frontImage,
                            backImage: propertyViewController.backImage,
                            picker: propertyViewController.picker,
                          );
                        },
                      );
              }),
      ],
    );
  }
}