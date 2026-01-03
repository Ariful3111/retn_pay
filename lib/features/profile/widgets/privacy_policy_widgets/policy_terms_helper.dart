import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

mixin PolicyTermsHelper {
  Widget titleText({
    required String text,
    required BuildContext context,
    double? fontSize,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextPrimary(
      text: text,
      fontSize: fontSize ?? 18.sp,
      color: isDark ? AppColors.darkAppBar : AppColors.primaryColorDark,
    );
  }

  Widget pointText({
    required String text,
    required BuildContext context,
    double? fontSize,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Icon(
            Icons.circle,
            size: 8.sp,
            color: isDark ? AppColors.darkAppBar : AppColors.primaryColorDark,
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: CustomTextPrimary(
            text: text,
            fontSize: fontSize ?? 14.sp,
            color: isDark ? AppColors.darkAppBar : AppColors.primaryColorDark,
          ),
        ),
      ],
    );
  }

  Widget plainText({required String text}) {
    return CustomTextPrimary(text: text,fontSize: 14.sp,fontWeight: FontWeight.w500,);
  }
}
