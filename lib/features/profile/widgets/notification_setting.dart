import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.secondaryText(
              text: "Notification",
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: themeController.isDarkMode.value?AppColors.whiteColor:AppColors.primaryDarkTextColor,
            ),
            CustomText.secondaryText(
              text: 'Stay updated with instant alerts and\nimportant reminders right on your device.',
              fontWeight: FontWeight.w400,
              color: themeController.isDarkMode.value?AppColors.darkSecondaryText:AppColors.secondaryTextColor,
            ),
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 28.h,
          width: 50.w,
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryColorDark,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: GestureDetector(
            onTap: (){},
            child: AnimatedAlign(
              alignment: Alignment.centerLeft,
              duration: Duration(milliseconds: 300),
              child: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
