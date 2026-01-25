import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/landlord_setting_items.dart';
import 'package:renter_pay/shared/widgets/custom_animation/custom_animated_switcher.dart';
import 'package:renter_pay/shared/widgets/custom_animation/custom_shadow_overlay_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';

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
        () => CustomAnimatedSwitcher(
          child: Stack(
            key: ValueKey(settingsController.isUpgrade.value),
            children: [
              LandlordSettingItems(),
              if (!settingsController.isUpgrade.value)
                CustomShadowOverlayButton().shadow(context: context),
              if (!settingsController.isUpgrade.value)
                Positioned(
                  left: 42.w,
                  right: 42.w,
                  bottom: 150.h,
                  child: CustomPrimaryButton(
                    height: 48.h,
                    width: 307.w,
                    text: 'Upgrade Your Plan',
                    onPressed: () {
                      settingsController.isUpgrade.value =
                          !settingsController.isUpgrade.value;
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
