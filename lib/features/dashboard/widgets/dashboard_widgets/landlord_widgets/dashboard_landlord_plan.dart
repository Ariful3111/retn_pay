import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/current_plan_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_plan_container.dart';
import 'package:renter_pay/features/profile/controllers/subscribe_plan_controller.dart';
import 'package:renter_pay/features/profile/repositories/subscribe_plan_repo.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class DashboardLandlordPlan extends GetWidget<CurrentPlanController> {
  const DashboardLandlordPlan({super.key});

  void _ensureSubscribeControllerRegistered() {
    // Register Repository first if not exists
    if (!Get.isRegistered<SubscribePlanRepository>()) {
      Get.lazyPut(
        () => SubscribePlanRepository(postWithoutResponse: Get.find()),
      );
    }

    // Then register Controller if not exists
    if (!Get.isRegistered<SubscribePlanController>()) {
      Get.lazyPut(
        () => SubscribePlanController(subscribePlanRepository: Get.find()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      // Show nothing if loading
      if (controller.isLoading.value) {
        return ButtonLoading();
      }

      // Find subscription with suggested upgrade
      final subscription = controller.getSubscriptionWithUpgrade();
      final upgradePlan = subscription?.suggestedUpgradePlan;

      // Show nothing if no upgrade suggestion found
      if (upgradePlan == null) {
        return SizedBox.shrink();
      }

      return Container(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 37.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            myShadow(dy: 282, alpha: 0.10),
            myShadow(dy: 1130, alpha: 0.09),
            myShadow(dy: 2542, alpha: 0.05),
            myShadow(dy: 4520, alpha: 0.01),
            myShadow(dy: 7062, alpha: 0.0),
          ],
        ),
        child: Column(
          children: [
            CustomTextPrimary(
              text: 'Upgrade to ${upgradePlan.name ?? 'Silver'} Plan',
              fontSize: 24.sp,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(height: 8.h),
            CustomTextSecondary(
              text: 'Upgrade your plan to unlock more features',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            DashboardLandlordPlanContainer(
              planName: upgradePlan.name ?? '',
              details:
                  upgradePlan.features
                      ?.map((e) => e.title)
                      .where((e) => e != null)
                      .cast<String>()
                      .join(', ') ??
                  '',
              amount: upgradePlan.price?.toString() ?? '',
            ),
            SizedBox(height: 24.h),
            // Ensure SubscribePlanController is registered before using
            Builder(
              builder: (context) {
                _ensureSubscribeControllerRegistered();
                return Obx(() {
                  return Get.find<SubscribePlanController>().isLoading.value
                      ? ButtonLoading()
                      : CustomPrimaryButton(
                          onPressed: () async {
                            await Get.find<SubscribePlanController>()
                                .subscribePlan(
                                  planID: upgradePlan.id ?? 0,
                                  isReloadCurrent: true,
                                  cancelNavigate: true,
                                );
                          },
                          height: 48.h,
                          width: 155.w,
                          text: 'Upgrade Now',
                        );
                });
              },
            ),
          ],
        ),
      );
    });
  }

  myShadow({required double dy, required double alpha}) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: 250,
      color: AppColors.darkPrimary.withValues(alpha: alpha),
    );
  }
}
