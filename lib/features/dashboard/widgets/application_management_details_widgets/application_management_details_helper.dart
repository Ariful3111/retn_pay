import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsHelper {
  Widget paragraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomTextSecondary(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  Widget divider({required bool isDark}) {
    return Divider(
      color: isDark ? AppColors.darkBorderPrimary : AppColors.secondaryBorder,
    );
  }
}