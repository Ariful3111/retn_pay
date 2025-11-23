import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class CustomEndAppbar extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onFavorite;
  final Widget ?notification;
  const CustomEndAppbar({super.key, required this.onTap, this.notification, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
     bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
        children: [
          GestureDetector(
            onTap: onFavorite,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                gradient: isDark?AppColors.darkAppIcon:LinearGradient(colors: [
                  AppColors.whiteColor,
                  AppColors.whiteColor
                ]),
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(width: 1.sp, color:isDark?AppColors.darkBorderPrimary: AppColors.primaryBorder),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1.03.sp),
                    blurRadius: 2.07.sp,
                    spreadRadius: 0,
                    color: Color(0xFF525866).withValues(alpha: 0.06),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  IconsPath.favorite,
                  height: 15.h,
                  width: 17.w,
                  color: isDark?AppColors.darkPrimary:null,
                ),
              ),
            ),
          ),
          ?notification,
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 32.h,
              width: 70.w,
              decoration: BoxDecoration(
                gradient: isDark?AppColors.darkAppIcon:LinearGradient(colors: [
                  AppColors.whiteColor,
                  AppColors.whiteColor
                ]),
                borderRadius: BorderRadius.circular(5.5.r),
                border: Border.all(width: 1.sp, color:isDark?AppColors.darkBorderPrimary: AppColors.primaryBorder),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0.88.sp),
                    blurRadius: 1.76.sp,
                    spreadRadius: 0,
                    color: Color(0xFF525866).withValues(alpha: 0.06),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextSecondary(text: 'Filter', fontSize: 12.sp,color: isDark?AppColors.darkPrimary:AppColors.secondaryTextColor,),
                  SizedBox(width: 8.h),
                  Image.asset(IconsPath.filter, height: 14.h, width: 14.w,color: isDark?AppColors.darkPrimary:null,),
                ],
              ),
            ),
          ),
        ],
      );
  }
}