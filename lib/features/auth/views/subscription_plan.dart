import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/auth/widgets/basic_plan.dart';
import 'package:renter_pay/features/auth/widgets/platinum_plan.dart';
import 'package:renter_pay/features/auth/widgets/silver_plan.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      gradient: AppColors.userBackground,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesPath.appLogo, height: 30.h, width: 170.w),
            SizedBox(height: 20.h),
            CustomText.primaryText(text: "Subscription Plan"),
            SizedBox(height: 32.h),
            BasicPlan(),
            SizedBox(height: 32.h,),
            SilverPlan(),
            SizedBox(height: 32.h,),
            PlatinumPlan(),
          ],
        ),
      ),
    );
  }
}
