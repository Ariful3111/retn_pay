import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomAppbarLeading extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  const CustomAppbarLeading({
    super.key,
    required this.onTap,
    this.icon,
    this.iconHeight,
    this.iconWidth,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Image.asset(
          icon ?? IconsPath.appbarBack,
          height: iconHeight ?? 24.h,
          width: iconWidth ?? 24.w,
          color: isDark ? AppColors.whiteColor : null,
        ),
      ),
    );
  }
}
