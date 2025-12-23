import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/basic_plan.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/platinum_plan.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/silver_plan.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

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
            CustomTextPrimary(text: "Subscription Plan"),
            SizedBox(height: 10.h,),
            Align(
              alignment: Alignment(0.9,0),
              child: CustomSecondaryButton(
                  height: 30.h,
                  width: 60.w,
                  borderRadius: BorderRadius.circular(6.r),
                  text: 'Skip',
                  onPressed: () {
                    Get.toNamed(AppRoutes.mainHome);
                  },
                ),
            ),
            SizedBox(height: 32.h),
            BasicPlan(),
            SizedBox(height: 32.h),
            SilverPlan(),
            SizedBox(height: 32.h),
            PlatinumPlan(),
          ],
        ),
      ),
    );
  }
}
