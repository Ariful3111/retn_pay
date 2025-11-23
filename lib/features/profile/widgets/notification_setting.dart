import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class NotificationSetting extends StatelessWidget {
  
  const NotificationSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text: "Notification",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: themeController.isDarkMode.value?AppColors.whiteColor:AppColors.primaryDarkTextColor,
              ),
              CustomTextSecondary(
                text: 'Stay updated with instant alerts and important reminders right on your device.',
                fontWeight: FontWeight.w400,
                color: themeController.isDarkMode.value?AppColors.darkSecondaryText:AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        Obx(() {
          return Switch(
            value: themeController.isDarkMode.value,
            onChanged: themeController.changeTheme,
            activeThumbColor: AppColors.whiteColor,
            inactiveThumbColor: AppColors.whiteColor,
            activeTrackColor: AppColors.primaryColorDark,
            inactiveTrackColor: Colors.grey,
            
          );
        }),
      ],
    );
  }
}
