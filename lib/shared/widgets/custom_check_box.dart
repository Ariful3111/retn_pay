import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  final Color? borderColor;
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChange, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: VisualDensity.compact,
      activeColor: AppColors.primaryColorDark,
      side: BorderSide(color:borderColor?? Color(0xFF697483),width: 2.r),
      value: isChecked,
      onChanged: onChange,
    );
  }
}
