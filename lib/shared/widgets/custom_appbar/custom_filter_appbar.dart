import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomFilterAppbar extends StatelessWidget {
  final VoidCallback onTap;
  const CustomFilterAppbar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h, 
        width: 70.w,
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.darkAppIcon
              : LinearGradient(
                  colors: [AppColors.whiteColor, AppColors.whiteColor],
                ),
          borderRadius: BorderRadius.circular(5.5.r),
          border: Border.all(
            width: 1.sp,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.primaryBorder,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.88.sp),
              blurRadius: 1.76.sp,
              spreadRadius: 0,
              color: AppColors.buttonShadowColor.withValues(alpha: 0.06),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextSecondary(
              text: 'Filter',
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.darkPrimary
                  : AppColors.secondaryTextColor,
            ),
            SizedBox(width: 8.h),
            Image.asset(
              IconsPath.filter,
              height: 14.h,
              width: 14.w,
              color: isDark ? AppColors.darkPrimary : null,
            ),
          ],
        ),
      ),
    );
  }
}
