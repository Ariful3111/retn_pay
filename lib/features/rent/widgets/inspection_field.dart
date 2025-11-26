import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class InspectionField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final  String? Function(String?)? validator;
  final  Widget? suffix;
  final  AutovalidateMode? validateMode;
  final  bool ?readOnly;
  const InspectionField({super.key, required this.controller, required this.label, required this.hint, this.validator, this.suffix, this.validateMode, this.readOnly});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      validation: validateMode,
      validator: validator,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color:isDark?AppColors.darkBorderPrimary: Color(0xFFDFE2E6)),
      ),
      enableBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color:isDark?AppColors.darkBorderPrimary: Color(0xFFDFE2E6)),
      ),
      focusBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color:isDark?AppColors.darkBorderPrimary: Color(0xFFDFE2E6)),
      ),
      fillColor:isDark? AppColors.darkPrimary:AppColors.whiteColor,
      labelTextWidget: CustomTextSecondary(
        text: label,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      hintTextWidget: CustomTextSecondary(text: hint),
      suffixIcon: suffix,
      readOnly: readOnly,
    );
  }
}