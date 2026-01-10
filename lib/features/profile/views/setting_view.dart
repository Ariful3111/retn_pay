import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/auto_pay_setting.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/dark_mode_setting.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/landlord_settings.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/notification_setting.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    int userIndex = 2;
    return CustomContainer(
      drawer: Drawer(),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: CustomScrollView(
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
                      SizedBox(height: 32.h),
                      AutoPaySetting(),
                      SizedBox(height: 32.h),
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
  }
}
