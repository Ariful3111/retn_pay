import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

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
  final TextEditingController controller;
  final TextDirection? textDirection;
  final double? width;
  final Widget? labelTextWidget;
  final String? labelText;
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AutovalidateMode? validation;
  final bool? isFilled;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final InputBorder? border;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? fillColor;
  final int? maxLength;
  final int? maxLines;
  final TextDirection? hintDirection;
  final bool? isAlignLabelWithHint;
  final double? fontHeight;
  final double? cursorHeight;
  final bool? isDense;
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
    required this.controller,
    this.textDirection,
    this.width,
    this.labelText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.readOnly,
    this.hintTextWidget,
    this.labelTextWidget,
    this.padding,
    this.margin,
    this.validation,
    this.isFilled,
    this.enableBorder,
    this.focusBorder,
    this.border,
    this.floatingLabelBehavior,
    this.fillColor,
    this.maxLength,
    this.maxLines,
    this.hintDirection,
    this.isAlignLabelWithHint,
    this.fontHeight,
    this.cursorHeight,
    this.isDense,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      maxLines: obscureText == true ? 1 : maxLines,
      maxLength: maxLength,
      textDirection: textDirection ?? TextDirection.ltr,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      autovalidateMode: validation,
      cursorHeight: cursorHeight,

      style: GoogleFonts.inter(
        color: isDark
            ? textColor ?? AppColors.darkPrimaryText
            : textColor ?? AppColors.primaryDarkTextColor,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: fontHeight,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        hintTextDirection: hintDirection,
        alignLabelWithHint: isAlignLabelWithHint,
        contentPadding: padding,
        isDense: isDense,
        label: labelTextWidget ?? CustomTextSecondary(text: labelText ?? ""),
        hint: hintTextWidget ?? CustomTextSecondary(text: hintText ?? ""),
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.4.r),
              borderSide: BorderSide(
                width: 0.78.r,
                color: isDark
                    ? AppColors.darkBorderPrimary
                    : AppColors.primaryBorder,
              ),
            ),
        focusedBorder:
            focusBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.4.r),
              borderSide: BorderSide(
                width: 0.78.r,
                color: isDark
                    ? AppColors.darkBorderPrimary
                    : AppColors.primaryBorder,
              ),
            ),
        enabledBorder:
            enableBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.4.r),
              borderSide: BorderSide(
                width: 0.78.r,
                color: isDark
                    ? AppColors.darkBorderPrimary
                    : AppColors.primaryBorder,
              ),
            ),
        filled: isFilled ?? true,
        fillColor: isDark
            ? fillColor ?? AppColors.darkPrimary
            : fillColor ?? AppColors.textFieldColor,
      ),
    );
  }
}
