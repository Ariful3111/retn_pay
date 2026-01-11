import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class FeedbackDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final Widget button;
  final double? height;
  const FeedbackDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.button, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      isBG: false,
      height:height?? 220.h,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(text: title, fontSize: 20.sp),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: subtitle,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 8.h),
          CustomTextField(controller: controller, maxLines: 2),
          SizedBox(height: 25.h),
          button,
        ],
      ),
    );
  }
}
