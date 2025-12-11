import 'package:flutter/material.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  const CustomCheckBox({super.key, required this.isChecked, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: VisualDensity.compact,
      activeColor: AppColors.primaryColorDark,
      side: BorderSide(color: Color(0xFF697483)),
      value: isChecked,
      onChanged: onChange,
    );
  }
}
