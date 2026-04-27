import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class CheckoutFooter extends StatelessWidget {
  final String checkoutType;
  final String label;
  final TextEditingController controller;
  const CheckoutFooter({
    super.key,
    required this.checkoutType,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomTextPrimary(
            text: checkoutType,
            fontSize: 20.sp,
            color: AppColors.primaryColorDark,
          ),
        ),
        SizedBox(height: 24.h),
        CustomTextField(
          controller: controller,
          labelText: label,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
