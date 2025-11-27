import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SuccessDialog extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? widget;
  final String? title1;
  final String? subtitle;
  final Widget? button;
  final String? buttonText;
  final VoidCallback? onTap;
  const SuccessDialog({
    super.key,
    this.widget,
    this.subtitle,
    this.button,
    this.buttonText,
    this.height,
    this.width,
    this.title1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      content: Container(
        height: height ?? 248.h,
        width: width ?? 362.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPath.successBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              right: 10.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 32.h,
                  width: 32.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F6F8),
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Image.asset(
                      IconsPath.close,
                      height: 8.h,
                      width: 8.w,
                    ),
                  ),
                ),
              ),
            ),
            widget ??
                Center(
                  child: Column(
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
                        text:
                            title1 ?? "Your ID has been verified successfully",
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
                      button ??
                          CustomPrimaryButton(
                            height: 40.h,
                            width: 172.w,
                            borderRadius: BorderRadius.circular(6.sp),
                            onPressed: onTap!,
                            text: buttonText ?? "Back To Dashboard",
                          ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
