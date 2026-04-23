import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceDetailsCommit extends StatelessWidget {
  const ServiceDetailsCommit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primaryColorDark,
      ),
      child: Column(
        children: [
          CustomTextPrimary(
            text: 'Your Satisfaction, Guaranteed!',
            fontSize: 22.sp,
            color: AppColors.whiteColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.h),
          CustomTextSecondary(
            text:
                'If you\'re not happy with our service, we\'ll fix it free of charge.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.darkSecondaryText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
