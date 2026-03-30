import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementHeader extends StatelessWidget {
  const AgreementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> item = [
      'This is your residential rental agreement. It is a binding contract under the Residential Tenancies Act 1997 (the Act).',
      'Parts A, B, C and E are the terms of your agreement. Part D is a summary of your rights and obligations.',
      'Do not sign this agreement if there is anything in it that you do not understand.',
      'Please refer to Renters Guide for details about your rights and responsibility.',
      'For further information, visit the renting section of the Consumer Affairs Victoria (CAV) website at www.consumer.vic.gov.au/renting or call 1300 558 181.',
    ];
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              CustomTextPrimary(
                text: 'Residential Rental Agreement',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  CustomTextPrimary(
                    text: 'No more than 5 years',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomTextSecondary(
                    text: 'Residential Tenancies Act 1997 Section 26(1)',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Descriptive Section
          CustomTextSecondary(
            text: 'Residential Tenancies Regulations 2021 Regulation 10(1)',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            softWrap: true,
          ),
          CustomBulletPointText(items: item),
        ],
      ),
    );
  }
}
