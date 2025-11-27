import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.notification);
      },
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(
            width: 0.89.sp,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.secondaryBorder,
          ),
          gradient: isDark?AppColors.darkAppIcon:LinearGradient(colors: [AppColors.whiteColor,AppColors.whiteColor]),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.89),
              blurRadius: 1.78,
              color:isDark? AppColors.darkBorderPrimary:Color(0xFF525866).withValues(alpha: 0.06),
            ),
          ],
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
                    color: Color(0xFFFF4D5E),
                  ),
                ),
              ),
              Image.asset(
                IconsPath.homeNotification,
                height: 18.h,
                width: 18.w,
                color: isDark?AppColors.darkPrimary:null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
