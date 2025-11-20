import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text_span.dart';

class DocumentUpload extends StatelessWidget {
  final String titleText;
  final double? height;
  final double? width;
  final VoidCallback onTap;
  const DocumentUpload({
    super.key,
    required this.titleText,
    this.height,
    this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            borderPadding: EdgeInsets.all(1.r),
            color: Color(0xFF9D5781),
            dashPattern: [3, 3], radius: Radius.circular(20.sp),
          ),
          child: Container(
            height: height ?? 225.h,
            width: width ?? 350.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextPrimary(
                  text: titleText,
                  fontSize: 16.sp,
                  color: AppColors.primaryTextColor,
                ),
                SizedBox(height: 28.5.h),
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(width: 1.15.sp, color: Color(0xFFDFE2E6)),
                    borderRadius: BorderRadius.circular(4.62.sp),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: onTap,
                      child: Image.asset(IconsPath.upload, height: 23.h, width: 20.w),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextSpan(
                      title: "Drag & Drop",
                      spantext: " image",
                      fontSize: 16.sp,
                      spanFontSize: 16.sp,
                      spanColor: AppColors.primaryColorDark,
                    ),
                    CustomTextPrimary(text: " here", fontSize: 16.sp),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextSecondary(text: "or "),
                    CustomTextSecondary(
                      text: "browse images",
                      color: AppColors.primaryColorDark,
                      textDecoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColorDark,
                    ),
                    CustomTextSecondary(text: " on your computer"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
