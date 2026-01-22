import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class BasicPlan extends StatelessWidget {
  final Widget? purchaseButton;
  const BasicPlan({super.key, this.purchaseButton});

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      widgetList: [
        BenefitsList(listText: 'List 1 property'),
        SizedBox(height: 12),
        BenefitsList(
          listText:
              'Ads on RenterPay page + social media\n(free 30 days, T&C apply)',
          fontSize: 14.sp,
        ),
        SizedBox(height: 12),
        BenefitsList(listText: 'Photography: 10-15 photos'),
        SizedBox(height: 12),
        BenefitsList(listText: 'Video Duration: 30-45 seconds'),
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
      purchaseButton:
          purchaseButton ??
          CustomSecondaryButton(
            onPressed: () {},
            text: "Buy",
            height: 52.h,
            width: 286.w,
          ),
    );
  }
}
