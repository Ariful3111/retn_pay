import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';

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
            }
          },
          backgroundColor: LinearGradient(
            colors: [AppColors.primaryColorDark, AppColors.primaryColorDark],
          ),
          text: "Submit for Verification",
        ),
      ],
    );
  }
}
