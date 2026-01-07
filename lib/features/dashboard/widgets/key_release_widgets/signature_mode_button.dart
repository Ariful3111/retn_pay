import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SignatureModeButton extends StatelessWidget {
  final RxString signatureMode;
  final ValueChanged<String> onModeChanged;
  const SignatureModeButton({
    super.key,
    required this.signatureMode,
    required this.onModeChanged,
  });

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
    return GestureDetector(
      onTap: () {
        onModeChanged(mode);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.52.h, horizontal: 13.63.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.81.r),
          color: signatureMode.value == mode
              ? AppColors.primaryColorDark
              : null,
        ),
        child: CustomTextSecondary(
          text: text,
          color: signatureMode.value == mode
              ? AppColors.whiteColor
              : null,
        ),
      ),
    );
  }
}
