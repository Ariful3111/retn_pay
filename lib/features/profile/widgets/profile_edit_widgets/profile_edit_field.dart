import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ProfileEditField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool readOnly;
  const ProfileEditField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomTextField(
      controller: controller,
      labelText: labelText,
      hintText: controller.text,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
      readOnly: readOnly,
    );
  }
}
