import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class AddNewPropertyInfoField extends StatelessWidget {
  final int? maxLine;
  final bool? isAlignLabelWithHint;
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  const AddNewPropertyInfoField({
    super.key,
    this.maxLine,
    this.isAlignLabelWithHint,
    required this.controller,
    required this.label,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      borderWidth: 1.r,
      borderRadius: 12.r,
      maxLines: maxLine,
      labelText: label,
      fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      isAlignLabelWithHint: isAlignLabelWithHint,
      keyboardType: keyboardType,
    );
  }
}
