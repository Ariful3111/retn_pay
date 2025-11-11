import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/profile/widgets/auto_pay_setting.dart';
import 'package:renter_pay/features/profile/widgets/dark_mode_setting.dart';
import 'package:renter_pay/features/profile/widgets/notification_setting.dart';
import 'package:renter_pay/shared/widgets/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    
      return ThemeSwitcher(
        builder: (context) {
          return Obx((){
            return CustomContainer(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            gradient: themeController.isDarkMode.value
                ? LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary,])
                : AppColors.userBackground.withOpacity(0.5),
            child: ListView(
              children: [
                CustomAppbar(title: 'Setting', onTap: () {}),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 15.w),
                  height: 370.h,
                  width: MediaQuery.widthOf(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    color:themeController.isDarkMode.value?AppColors.darkSecondary :AppColors.whiteColor,
                  ),
                  child: Column(
                    children: [
                      NotificationSetting(),
                      SizedBox(height: 32.h),
                      DarkModeSetting(),
                      SizedBox(height: 32.h),
                      AutoPaySetting(),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            ),
          );
          });
        },
      );
    
  }
}
