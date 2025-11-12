import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/benefits_list.dart';
import 'package:renter_pay/features/profile/widgets/subscription_container.dart';

class PlatinumPlan extends StatelessWidget {
  const PlatinumPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SubscriptionContainer(
      planBG: AppColors.platinumPlanBG,
      planIcon: IconsPath.platinumPlan,
      planIconBG: AppColors.platinumIconBG,
      planTitle: "Platinum",
      planSubtitle: '(Free 15 days for first-time users)',
      price: '\$2199',
      sizeBoxHeight: 16.h,
      widgetList: [
        BenefitsList(listText: "List up to 10 properties (more than 3\nallowed)",fontSize: 14.sp,),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Ads on RenterPay page + social media\n(free 30 days, T&C apply)",fontSize: 14.sp,),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Photography: 40-60 photos"),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Video curation: 90-120 seconds"),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Free appraisal"),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Access to all documentation online"),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Sale/lease signage included"),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "36 hours free legal advice (tenancies\nor sale)",fontSize: 14.sp,),
        SizedBox(height: 12.h,),
        BenefitsList(listText: "Dedicated agent assigned (professional\nhelp)",fontSize: 14.sp,),
        SizedBox(height: 12.h,),
      ], onTap: (){});
  }
}