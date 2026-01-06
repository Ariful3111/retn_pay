import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/dashboard_properties.dart';
import 'package:renter_pay/shared/widgets/custom_animated_switcher.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_shadow_overlay_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    int userIndex = 1;
    return CustomContainer(
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: CustomScrollView(
        controller: dashboardController.scrollController,
        slivers: [
          DashboardAppbar(),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
               if(userIndex==1) Obx(
                  () => CustomAnimatedSwitcher(
                    child: Stack(
                      key: ValueKey(dashboardController.isUpgrade.value),
                      children: [
                        DashboardProperties(),
                        if (!dashboardController.isUpgrade.value)
                          CustomShadowOverlayButton().shadow(context: context,imageFilter: ImageFilter.blur(sigmaX: 2,sigmaY: 2)),
                        if (!dashboardController.isUpgrade.value)
                          Positioned(
                            top: 460.h,
                            left: 60.w,
                            right: 60.w,
                            child: CustomPrimaryButton(
                              onPressed: () {
                                dashboardController.isUpgrade.value =
                                    !dashboardController.isUpgrade.value;
                              },
                              height: 48.h,
                              width: 307.w,
                              text: 'Upgrade Your Plan',
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if(userIndex==0) DashboardProperties(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
