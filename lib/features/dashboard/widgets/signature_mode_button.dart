import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SignatureModeButton extends StatelessWidget {
  const SignatureModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 52.h,
      width: 153.w,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: isDark
            ? LinearGradient(
                colors: [
                  AppColors.primaryTextColor,
                  AppColors.primaryTextColor,
                ],
              )
            : AppColors.userBackground,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            drawButton(text: 'Draw', mode: 'draw'),
            drawButton(text: 'Type', mode: 'type'),
          ],
        ),
      ),
    );
  }

  Widget drawButton({required String text, required String mode}) {
    KeyReleaseController keyReleaseController = Get.find();
    return GestureDetector(
      onTap: () {
        keyReleaseController.signatureMode.value = mode;
        keyReleaseController.signatureController.clear();
        keyReleaseController.drawController.clear();
        keyReleaseController.typedText.value = '';
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.52.h, horizontal: 13.63.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.81.r),
          color: keyReleaseController.signatureMode.value == mode
              ? AppColors.primaryColorDark
              : null,
        ),
        child: CustomTextSecondary(
          text: text,
          color: keyReleaseController.signatureMode.value == mode
              ? AppColors.whiteColor
              : null,
        ),
      ),
    );
  }
}
