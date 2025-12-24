import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';

SettingsController settingsController = Get.find();

class LandlordSettingsUpgrade {
   shadow({required BuildContext context}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
     return Positioned.fill(
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(),
            child: Container(
              height: 472.h,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                    isDark
                        ? AppColors.darkSecondary
                        : AppColors.whiteColor.withValues(alpha: 0.85),
                    isDark
                        ? AppColors.darkSecondary.withValues(alpha: 0.5)
                        : AppColors.whiteColor.withValues(alpha: 0.5),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
  button({required VoidCallback onTap}) {
     return Positioned(
        left: 42.w,
        right: 42.w,
        bottom: 150.h,
        child: CustomPrimaryButton(
          height: 48.h,
          width: 307.w,
          text: 'Upgrade Your Plan',
          onPressed: onTap,
        ),
      );
  }
}
