import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AutoPaySetting extends StatelessWidget {
  
  const AutoPaySetting({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    SettingsController settingsController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomTextSecondary(
                text: "Auto-Pay Rent",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: themeController.isDarkMode.value?AppColors.whiteColor:AppColors.primaryDarkTextColor,
              ),
              CustomTextSecondary(
                text: 'Set up automatic payments and never miss a rent due date again..',
                fontWeight: FontWeight.w400,
                color: themeController.isDarkMode.value?AppColors.darkSecondaryText:AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        Obx(() {
          return Switch(
            value: settingsController.isAutoPayment.value,
            onChanged: (value) {
              settingsController.isAutoPayment.value = value;
            },
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
