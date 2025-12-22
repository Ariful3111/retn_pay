import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

mixin ServiceFromField {
  Widget myField({
    required TextEditingController controller,
    required BuildContext context,
    required Widget labelText,
    int ? maxLines,
    bool ? isAlignLabelWithHint,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      borderRadius: 12.r,
      focusBorderRadius: BorderRadius.circular(12.r),
      enableBorderRadius: BorderRadius.circular(12.r),
      borderWidth: 1.r,
      focusBorderWidth: 1.r,
      enableBorderWidth: 1.r,
      fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      labelTextWidget: labelText,
      maxLines: maxLines,
      isAlignLabelWithHint: isAlignLabelWithHint,
    );
  }
}
