import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomCloseButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final VoidCallback onTap;
  final Color? color;
  const CustomCloseButton({
    super.key,
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    required this.onTap, this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 32.h,
        width: width ?? 32.h,
        decoration: BoxDecoration(
          color: isDark ?color?? AppColors.darkSecondary : color?? AppColors.whiteButtonColor,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: Center(
          child: Image.asset(
            IconsPath.close,
            height: iconHeight ?? 8.h,
            width: iconWidth ?? 8.w,
            color: isDark ? AppColors.whiteColor : null,
          ),
        ),
      ),
    );
  }
}
