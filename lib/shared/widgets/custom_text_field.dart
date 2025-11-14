import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
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
  final AutovalidateMode? validation;
  final bool ?isFilled;
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
    this.margin, this.validation,  this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return TextFormField(
      controller: controller,
      textDirection: textDirection ?? TextDirection.ltr,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      autovalidateMode: validation,
      style: TextStyle(color: themeController.isDarkMode.value?AppColors.darkPrimaryText:AppColors.primaryDarkTextColor),
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
        
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: BoxConstraints(minHeight: 0,minWidth: 0),
        prefixIconConstraints: BoxConstraints(minHeight: 0,minWidth: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color:themeController.isDarkMode.value?AppColors.darkBorderPrimary :Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color:themeController.isDarkMode.value?AppColors.darkBorderPrimary : Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(color:themeController.isDarkMode.value?AppColors.darkBorderPrimary : Colors.transparent),
        ),
        filled:isFilled?? true,
        fillColor:themeController.isDarkMode.value?AppColors.darkPrimary: AppColors.textFieldColor,
      ),
    );
  }
}
