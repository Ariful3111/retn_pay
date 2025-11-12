import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_container.dart';

class BasicPlan extends StatelessWidget {
  const BasicPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      widgetList: [
        BenefitsList(listText: 'List 1 property'),
        SizedBox(height: 12),
        BenefitsList(
          listText: 'Ads on RenterPay page + social media\n(free 30 days, T&C apply)',
          fontSize: 14.sp,
        ),
        SizedBox(height: 12),
        BenefitsList(listText: 'Photography: 10-15 photos'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Video curation: 30-45 seconds'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Free rental appraisal'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Access to all documentation online'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Sale/lease signage included'),
        SizedBox(height: 12),
        BenefitsList(
          listText: '4 hours free legal advice (first contract\nduration)',
          fontSize: 14.sp,
        ),
        SizedBox(height: 12),
      ],
      onTap: () {
        Get.toNamed(AppRoutes.mainHome);
      },
    );
  }
}
