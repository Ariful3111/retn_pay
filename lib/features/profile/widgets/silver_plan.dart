import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/benefits_list.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/features/profile/widgets/subscription_container.dart';

class SilverPlan extends StatelessWidget {
  const SilverPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      stackList: Positioned(
        top: 5.h,
        right: 5.w,
        child: Container(
          height: 29.h,
          width: 100.w,
          decoration: BoxDecoration(
            gradient: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50.sp),
            border: Border.all(width: 0.5.sp, color: AppColors.lightBorder),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4.sp,
                spreadRadius: 0.sp,
                color: Color(0xFFDFEEFF).withValues(alpha: 0.30),
              ),
              BoxShadow(
                offset: Offset(0.sp, 1.sp),
                blurRadius: 1.sp,
                spreadRadius: 0.sp,
                color: AppColors.whiteColor.withValues(alpha: 0.35),
              ),
              BoxShadow(
                offset: Offset(0.sp, -2.sp),
                blurRadius: 1.sp,
                spreadRadius: 0.sp,
                color: Color(0xFF004289).withValues(alpha: 0.07),
              ),
              BoxShadow(
                offset: Offset(0.sp, 1.sp),
                blurRadius: 2.sp,
                spreadRadius: 0.sp,
                color: Color(0xFF004289).withValues(alpha: 0.15),
              ),
            ],
          ),
          child: Center(
            child:CustomTextPrimary(
              text: "Most popular",
              fontSize: 12.sp,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
      planBG: AppColors.silverPlanBG,
      planIcon: IconsPath.silverPlan,
      planIconBG: AppColors.silverIconBG,
      planTitle: 'Silver',
      planSubtitle: '(Free 15 days for first-time users)',
      price: '\$799',
      widgetList: [
        BenefitsList(listText: 'List up to 3 properties'),
        SizedBox(height: 12),
        BenefitsList(
          listText: 'Ads on RenterPay page + social media\n(free 30 days, T&C apply)',
          fontSize: 14.sp,
        ),
        SizedBox(height: 12),
        BenefitsList(listText: 'Photography: 15-30 photos'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Video curation: 45-75 seconds'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Free appraisal'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Access to all documentation online'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Sale/lease signage included'),
        SizedBox(height: 12),
        BenefitsList(listText: '12 hours free legal advice (tenancies\nor sale))', fontSize: 14.sp),
        SizedBox(height: 12),
      ],
      onTap: () {},
    );
  }
}
