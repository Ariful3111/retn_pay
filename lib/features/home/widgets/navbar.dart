import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 8.h),
        height: 82.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withValues(alpha: 0.80),
          border: Border.all(width: 1.sp, color: Color(0xFFEBEDF0)),
          borderRadius: BorderRadius.circular(12.sp),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(mainHomeController.navItems.length, (index) {
            final itemCount = mainHomeController.selectIndex.value == index;
            final navItem = mainHomeController.navItems[index];
            final navIcon = navItem['icon'];
            final navLabel = navItem['label'];
            Widget iconWidget = SizedBox.shrink();
            if (navIcon is String) {
              iconWidget = Image.asset(
                navIcon,
                color: itemCount ? AppColors.primaryColorDark : AppColors.secondaryTextColor,
                height: 24.h,
                width: 24.w,
              );
            }
            if (navIcon == 'profile') {
              iconWidget = Icon(
                Icons.person,
                size: 24.sp,
                color: itemCount ? AppColors.primaryColorDark : AppColors.secondaryTextColor,
              );
            } else if (navIcon is Widget) {
              iconWidget = navIcon;
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              child: GestureDetector(
                onTap: () {
                  mainHomeController.changeIndex(index);
                },
                child: Column(
                  children: [
                    iconWidget,
                    SizedBox(height: 10.h),
                    Text(
                      navLabel,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: itemCount
                            ? AppColors.primaryColorDark
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
