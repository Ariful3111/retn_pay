import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/auto_pay_setting.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/dark_mode_setting.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/landlord_settings.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/notification_setting.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/subscription_setting.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class SettingView extends GetView<SettingsController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        drawer: Drawer(),
        gradient: isDark
            ? LinearGradient(
                colors: [AppColors.darkPrimary, AppColors.darkPrimary],
              )
            : AppColors.userBackground.withOpacity(0.5),
        child: controller.isLoading.value
            ? Center(child: ButtonLoading())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    titleSpacing: 0.w,
                    title: CustomAppbar(title: 'Setting'),
                  ),
                  SliverPadding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 15.w,
                          ),
                          width: MediaQuery.widthOf(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.sp),
                            color: isDark
                                ? AppColors.darkSecondary
                                : AppColors.whiteColor,
                          ),
                          child: Column(
                            children: [
                              NotificationSetting(),
                              SizedBox(height: 32.h),
                              DarkModeSetting(),
                              if (userIndex != 2) SizedBox(height: 32.h),
                              if (userIndex == 1 || userIndex == 0)
                                AutoPaySetting(),
                              if (userIndex == 3) SubscriptionSetting(),
                            ],
                          ),
                        ),
                        if (userIndex == 1) LandlordSettings(),
                      ]),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
