import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairRequestInfo extends StatelessWidget {
  const RepairRequestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: 'Maple Grove', fontSize: 24.sp),
        SizedBox(height: 12.h),
        CustomTextSecondary(
          text: '987 Birch Boulevard',
          color: AppColors.darkLightText,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dateTime(
              title: 'Date:',
              subTitle: '2 July, 2025',
            ),
            dateTime(
              title: 'Time:',
              subTitle: '12:30 p.m',
            ),
          ],
        ),
      ],
    );
  }

  Widget dateTime({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title, color: AppColors.darkLightText),
        SizedBox(height: 4.h),
        CustomTextPrimary(
          text: subTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
