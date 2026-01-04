import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomDateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? fillColor;
  final String? label;
  const CustomDateField({
    super.key,
    required this.controller,
    required this.onTap,
    this.textColor,
    this.fillColor, this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      labelTextWidget: CustomTextSecondary(
        text:label?? 'Date*',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      hintText: 'Select Date',
      readOnly: true,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(IconsPath.date, height: 15.66.h, width: 15.66.w),
        ),
      ),
      textColor: textColor,
      fillColor: fillColor,
    );
  }
}
