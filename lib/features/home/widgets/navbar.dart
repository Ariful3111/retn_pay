import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/nav_chat.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkPrimary.withValues(alpha: 0.80)
              : AppColors.whiteColor.withValues(alpha: 0.80),
          border: Border.all(
            width: 1.sp,
            color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
          ),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(mainHomeController.navItems.length, (index) {
            bool itemCount = mainHomeController.selectIndex.value == index;
            final navItem = mainHomeController.navItems[index];
            final navIcon = navItem['icon'];
            final navLabel = navItem['label'];
            bool isColor = navItem['isColor'];
            return InkWell(
              onTap: () {
                mainHomeController.changeIndex(index);
              },
              child: Column(
                children: [
                  navLabel != 'Chat'
                      ? Image.asset(
                          navIcon,
                          color: isColor
                              ? itemCount
                                    ? AppColors.primaryColorDark
                                    : isDark
                                    ? AppColors.darkPrimaryText
                                    : AppColors.secondaryTextColor
                              : null,
                          height: 24.h,
                          width: 24.w,
                        )
                      : SizedBox(
                          child: NavChat(
                            isColor: isColor,
                            itemCount: itemCount,
                          ),
                        ),
                  SizedBox(height: 10.h),
                  Text(
                    navLabel,
                    style: itemCount
                        ? GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.borderColor,
                          )
                        : GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: isDark
                                ? AppColors.darkPrimaryText
                                : AppColors.secondaryTextColor,
                          ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
