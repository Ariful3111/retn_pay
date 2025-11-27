import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class ProfileEditField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  const ProfileEditField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      hintTextWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: labelText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          CustomTextSecondary(text: hintText),
        ],
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: isDark ? AppColors.darkBorderPrimary : AppColors.primaryBorder,
        ),
      ),
      enableBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: isDark ? AppColors.darkBorderPrimary : AppColors.primaryBorder,
        ),
      ),
      focusBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: isDark ? AppColors.darkBorderPrimary : AppColors.primaryBorder,
        ),
      ),
    );
  }
}
