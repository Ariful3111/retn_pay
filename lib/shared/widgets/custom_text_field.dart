import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final Widget? hintTextWidget;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final double? width;
  final Widget? labelTextWidget;
  final String? labelText;
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.keyboardType,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.controller,
    this.textDirection,
    this.width,
    this.labelText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.autovalidateMode,
    this.readOnly,
    this.hintTextWidget,
    this.labelTextWidget,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: textDirection ?? TextDirection.ltr,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        label:
            labelTextWidget ??
            CustomText.secondaryText(
              text: labelText ?? "",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
        hint:
            hintTextWidget ??
            CustomText.primaryText(
              text: hintText ?? "",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
        errorText: errorText,
        hintStyle: GoogleFonts.inter(
          color: textColor ?? AppColors.secondaryTextColor,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: AppColors.textFieldColor,
      ),
    );
  }
}
