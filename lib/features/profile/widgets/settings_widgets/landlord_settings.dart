import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/landlord_setting_items.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/landlord_settings_upgrade.dart';

class LandlordSettings extends StatelessWidget {
  const LandlordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SettingsController settingsController = Get.find();
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween(begin: 0.97, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
          child: Stack(
            key: ValueKey(settingsController.isUpgrade.value),
            children: [
              LandlordSettingItems(),
              if (!settingsController.isUpgrade.value)
                LandlordSettingsUpgrade().shadow(context: context),
              if (!settingsController.isUpgrade.value)
                LandlordSettingsUpgrade().button(
                  onTap: () {
                    settingsController.isUpgrade.value =
                        !settingsController.isUpgrade.value;
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
