import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomAppbar({
    super.key,
    required this.title,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextPrimary(
      text: title,
      fontSize: fontSize ?? 20.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: isDark
          ? textColor ?? AppColors.darkAppBar
          : textColor ?? AppColors.primaryTextColor,
    );
  }
}
