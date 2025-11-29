import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class DarkModeSetting extends StatelessWidget {
  const DarkModeSetting({super.key});
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
                text: "Dark Mode",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: themeController.isDarkMode.value
                    ? AppColors.whiteColor
                    : AppColors.primaryDarkTextColor,
              ),
              CustomTextSecondary(
                text:
                    'Enjoy a sleek, eye-friendly interface with our easy-to-switch dark mode..',
                fontWeight: FontWeight.w400,
                color: themeController.isDarkMode.value
                    ? AppColors.darkSecondaryText
                    : AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        Obx(() {
          return CustomSwitchButton(isOn: themeController.isDarkMode.value, onChanged: themeController.changeTheme);
        }),
      ],
    );
  }
}
