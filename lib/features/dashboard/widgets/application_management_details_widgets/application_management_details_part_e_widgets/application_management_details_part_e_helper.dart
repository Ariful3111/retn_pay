import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartEHelper {
  static Widget sectionTitle(String text, bool isDark, {double? size}) {
    return CustomTextSecondary(
      text: text,
      fontSize: size ?? 18.sp,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }

  static Widget textField(
    TextEditingController controller,
    String label,
    bool isDark, {
    int? maxLines,
    bool? isAlignLabelWithHint,
    bool readOnly = false,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: CustomTextField(
        enableBorderRadius: BorderRadius.circular(12.r),
        enableBorderWidth: 1.r,
        focusBorderRadius: BorderRadius.circular(12.r),
        focusBorderWidth: 1.r,
        borderRadius: 12.r,
        borderWidth: 1.r,
        controller: controller,
        labelText: label,
        fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        maxLines: maxLines,
        isAlignLabelWithHint: isAlignLabelWithHint,
        readOnly: readOnly,
        keyboardType: keyboardType,
      ),
    );
  }
}
