// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged onChange;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: AppColors.primaryColorDark,
        ),
        CustomTextSecondary(
          text: text,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 12.sp,
        ),
      ],
    );
  }
}
