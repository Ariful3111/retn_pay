import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

mixin ServiceBookInfo {
  Widget myInfo({required String title, required String data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title,color:AppColors.darkLightText ,),
        SizedBox(height: 4.h),
        CustomTextPrimary(
          text: data,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}