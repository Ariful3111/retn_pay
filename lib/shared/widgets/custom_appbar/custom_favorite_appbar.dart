import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomFavoriteAppbar extends StatelessWidget {
  final VoidCallback onFavorite;
  const CustomFavoriteAppbar({super.key, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onFavorite,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.darkAppIcon
              : LinearGradient(
                  colors: [AppColors.whiteColor, AppColors.whiteColor],
                ),
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(
            width: 1.sp,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.primaryBorder,
          ),
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
            color: isDark ? AppColors.darkPrimary : null,
          ),
        ),
      ),
    );
  }
}
