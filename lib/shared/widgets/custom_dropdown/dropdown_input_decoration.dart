import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class DropdownInputDecoration {
  inputDecoration({
    required BuildContext context,
    required Color? fillColor,
    required InputBorder? enableBorder,
    required InputBorder? focusBorder,
    required double? focusBorderWidth,
    required double? borderWidth,
    required double? borderRadius,
    required double? focusBorderRadius,
    required EdgeInsets? contentPadding,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InputDecorationTheme(
      filled: true,
      fillColor: isDark
          ? fillColor ?? AppColors.darkPrimary
          : fillColor ?? AppColors.whiteColor,
      contentPadding: contentPadding,
      focusColor: Colors.transparent,
      enabledBorder:
          enableBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 9.4.r),
            borderSide: BorderSide(
              width: borderWidth ?? 0.78.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
          ),
      focusedBorder:
          focusBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(focusBorderRadius ?? 9.4.r),
            borderSide: BorderSide(
              width: focusBorderWidth ?? 0.78.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.primaryBorder,
            ),
          ),
    );
  }
}
