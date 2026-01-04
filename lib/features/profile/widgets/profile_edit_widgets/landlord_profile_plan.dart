import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/basic_plan.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/platinum_plan.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/silver_plan.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordProfilePlan extends StatelessWidget {
  const LandlordProfilePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextPrimary(text: 'My Current Plan', fontSize: 28.sp),
        SizedBox(height: 20.h),
        BasicPlan(
          purchaseButton: CustomSecondaryButton(
            onPressed: () {},
            text: "Downgrade",
            height: 52.h,
            width: 286.w,
          ),
        ),
        SizedBox(height: 32.h),
        SilverPlan(
          purchaseButton: CustomSecondaryButton(
            onPressed: () {},
            text: "Purchased",
            height: 52.h,
            width: 286.w,
            borderColor: AppColors.darkLightText,
            textColor: AppColors.darkLightText,
          ),
        ),
        SizedBox(height: 32.h),
        PlatinumPlan(
          purchaseButton: CustomSecondaryButton(
            onPressed: () {},
            text: "Upgrade",
            height: 52.h,
            width: 286.w,
          ),
        ),
      ],
    );
  }
}
