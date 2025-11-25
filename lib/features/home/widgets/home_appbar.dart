import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Row(
      children: [
        Image.asset(ImagesPath.homeAppbar,height: 44.h,width: 44.w,),
        SizedBox(width: 8.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPrimary(text: 'Hi,Sakib',fontSize: 20.sp,fontWeight: FontWeight.w500),
            CustomTextSecondary(text: 'Welcome to Renterpay',fontSize: 14.sp,fontWeight: FontWeight.w400,color:themeController.isDarkMode.value?AppColors.darkSecondaryText:AppColors.primaryDarkTextColor.withValues(alpha: 0.80)),
          ],
        ),
        Spacer(),
        CustomNotificationButton(),
      ],
    );
  }
}