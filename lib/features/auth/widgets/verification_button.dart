import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/success_dialog.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    DocumentVerificationController documentVerificationController = Get.find();
    return Row(
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
            );
  }
}