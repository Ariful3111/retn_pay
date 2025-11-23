import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/core/utils/snackbar.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/document_verification/custom_dotted_border.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/document_verification/document_upload.dart';
import 'package:renter_pay/shared/widgets/success_dialog.dart';

class DocumentVerification extends StatelessWidget {
  const DocumentVerification({super.key});

  @override
  Widget build(BuildContext context) {
    DocumentVerificationController documentVerificationController = Get.find();
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
            Obx(() {
              final frontImage =
                  documentVerificationController.frontImage.value;
              return frontImage != null
                  ? CustomDottedBorder(image: frontImage)
                  : DocumentUpload(
                      titleText: 'Front Side',
                      onTap: () {
                        UploadImage.pickDocument(
                          type: 'front',
                          frontImage: documentVerificationController.frontImage,
                          backImage: documentVerificationController.backImage,
                          picker: documentVerificationController.picker,
                        );
                      },
                    );
            }),
            SizedBox(height: 20.h),
            Obx(() {
              final backImage = documentVerificationController.backImage.value;
              return backImage != null
                  ? CustomDottedBorder(image: backImage)
                  : DocumentUpload(
                      titleText: 'Back Side (Optional)',
                      onTap: () {
                        UploadImage.pickDocument(
                          type: 'back',
                          frontImage: documentVerificationController.frontImage,
                          backImage: documentVerificationController.backImage,
                          picker: documentVerificationController.picker,
                        );
                      },
                    );
            }),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSecondaryButton(
                  onPressed: () {
                    Get.back();
                  },
                  height: 52.h,
                  width: 117.w,
                  borderColor: AppColors.primaryColorDark,
                  borderRadius: BorderRadius.circular(8.sp),
                  borderWidth: 1.w,
                  text: "Cancel",
                ),
                CustomPrimaryButton(
                  height: 52.h,
                  width: 231.w,
                  onPressed: () {
                    if (documentVerificationController.frontImage.value == null) {
                      errorSnack(message: 'Front Document Is Required');
                      showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          onTap: () {
                            Get.toNamed(AppRoutes.mainHome);
                          },
                        );
                      },
                    );
                    } else {
                      showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          onTap: () {
                            Get.toNamed(AppRoutes.mainHome);
                          },
                        );
                      },
                    );
                    }
                  },
                  backgroundColor: LinearGradient(
                    colors: [
                      AppColors.primaryColorDark,
                      AppColors.primaryColorDark,
                    ],
                  ),
                  text: "Submit for Verification",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
