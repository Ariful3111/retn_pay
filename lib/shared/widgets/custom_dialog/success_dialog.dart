import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_close_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SuccessDialog extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? widget;
  final String? title1;
  final String? subtitle;
  final Widget? button;
  const SuccessDialog({
    super.key,
    this.widget,
    this.subtitle,
    this.button,
    this.height,
    this.width,
    this.title1,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      content: Container(
        height: height ?? 248.h,
        width: width ?? 362.w,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPath.successBackground),
            fit: BoxFit.cover,
          ),
        boxShadow: [myShadow(dy: 200.63, alpha: 0.10),myShadow(dy: 803.95, alpha: 0.09),myShadow(dy: 1808.54, alpha: 0.05),myShadow(dy: 3215.81, alpha: 0.01),myShadow(dy: 5024.35, alpha: 0.0)]
        ),
        child: Stack(
          children: [
            widget ??
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.h,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(35.sp),
                      ),
                      child: Center(
                        child: Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryColor,
                            border: Border.all(
                              width: 2.sp,
                              color: AppColors.whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(25.sp),
                          ),
                          child: Center(
                            child: Image.asset(
                              IconsPath.ok,
                              height: 12.h,
                              width: 17.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextPrimary(
                      text: title1 ?? "Your ID has been verified successfully",
                      color: AppColors.primaryColorDark,
                      fontSize: 20.sp,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6.h),
                    CustomTextSecondary(
                      text: subtitle ?? 'You can now continue.',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),
                    ?button,
                  ],
                ),
            Positioned(
              top: 0.h,
              right: 0.w,
              child: CustomCloseButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxShadow myShadow({required double dy,required double alpha}) {
    return BoxShadow(offset: Offset(0, dy),blurRadius: 177.87,color: AppColors.darkPrimary.withValues(alpha: alpha));
  }
}
