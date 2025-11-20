import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_secondary.dart';

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
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.notification);
          },
          child: Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              border: Border.all(width: 0.89.sp,color:themeController.isDarkMode.value? AppColors.darkBorderPrimary: AppColors.secondaryBorder),
              color: themeController.isDarkMode.value?AppColors.darkSecondary:AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.89),
                  blurRadius: 1.78,
                  color: Color(0xFF525866).withValues(alpha: 0.06),
                ),
              ]
            ),
            child: Center(
              child: Stack(
                children: [
                 Positioned(
                  top: 1.50.h,
                  right: 1.50.w,
                  child: Container(
                      height: 6.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: Color(0xFFFF4D5E)
                      ),
                    ),),
                  Image.asset(IconsPath.homeNotification,height: 18.h,width: 18.w,),  
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}