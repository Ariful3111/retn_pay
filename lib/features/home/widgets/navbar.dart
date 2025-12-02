import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    ThemeController themeController = Get.find();
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 8.h),
        height: 82.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? AppColors.darkPrimary.withValues(alpha: 0.80)
              : AppColors.whiteColor.withValues(alpha: 0.80),
          border: Border.all(
            width: 1.sp,
            color: themeController.isDarkMode.value
                ? AppColors.darkBorderPrimary
                : AppColors.whiteBorder,
          ),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(mainHomeController.navItems.length, (index) {
            final itemCount = mainHomeController.selectIndex.value == index;
            final navItem = mainHomeController.navItems[index];
            final navIcon = navItem['icon'];
            final navLabel = navItem['label'];
            final isColor = navItem['isColor'];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              child: InkWell(
                onTap: () {
                  mainHomeController.changeIndex(index);
                },
                child: Column(
                  children: [
                    Image.asset(
                      navIcon,
                      color: isColor
                          ? itemCount
                                ? AppColors.primaryColorDark
                                : themeController.isDarkMode.value
                                ? AppColors.darkPrimaryText
                                : AppColors.secondaryTextColor
                          : null,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      navLabel,
                      style: itemCount
                          ? GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColorDark,
                            )
                          : GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: themeController.isDarkMode.value
                                  ? AppColors.darkPrimaryText
                                  : AppColors.secondaryTextColor,
                            ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
