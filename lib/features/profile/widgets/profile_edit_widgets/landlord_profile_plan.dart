import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/current_plan_controller.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/basic_plan.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordProfilePlan extends GetWidget<CurrentPlanController> {
  const LandlordProfilePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : Column(
              children: [
                CustomTextPrimary(text: 'My Current Plan', fontSize: 28.sp),
                SizedBox(height: 20.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.currentPlan.value?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final subscription =
                        controller.currentPlan.value?.data?[index];
                    if (subscription == null) return SizedBox.shrink();

                    return Padding(
                      padding: EdgeInsets.only(bottom: 32.h),
                      child: BasicPlan(
                        currentSubscription: subscription,
                        buttonText: 'Current Plan',
                        isCurrent: true,
                      ),
                    );
                  },
                ),

                // SizedBox(height: 32.h),
                // SilverPlan(
                //   purchaseButton: CustomSecondaryButton(
                //     onPressed: () {},
                //     text: "Purchased",
                //     height: 52.h,
                //     width: 286.w,
                //     borderColor: AppColors.darkLightText,
                //     textColor: AppColors.darkLightText,
                //   ),
                // ),
                // SizedBox(height: 32.h),
                // PlatinumPlan(
                //   purchaseButton: CustomSecondaryButton(
                //     onPressed: () {},
                //     text: "Upgrade",
                //     height: 52.h,
                //     width: 286.w,
                //   ),
                // ),
              ],
            );
    });
  }
}
