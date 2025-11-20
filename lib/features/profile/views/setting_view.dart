import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/auto_pay_setting.dart';
import 'package:renter_pay/features/profile/widgets/dark_mode_setting.dart';
import 'package:renter_pay/features/profile/widgets/notification_setting.dart';
import 'package:renter_pay/shared/widgets/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
      return CustomContainer(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            gradient: isDark
                ? LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary,])
                : AppColors.userBackground.withOpacity(0.5),
            child: ListView(
              children: [
                CustomAppbar(title: 'Setting', onTap: () {}),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 15.w),
                  width: MediaQuery.widthOf(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    color:isDark?AppColors.darkSecondary :AppColors.whiteColor,
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
  }
}
