import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
class TableActionButton extends StatelessWidget {
  final String icon;
  final Color? color;
  final VoidCallback onTap;
  final Color? iconColor;
  const TableActionButton({super.key, required this.icon, this.color, required this.onTap, this.iconColor});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5.r),
        padding: EdgeInsets.all(5.r),
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
          color: isDark
              ? color ?? AppColors.darkContainer
              : color ?? AppColors.whiteColor,
          border: Border.all(
            width: 1.r,
            color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(icon, height: 24.h, width: 24.w, color: isDark?iconColor??AppColors.whiteColor:iconColor),
        ),
      ),
    );
  }
}
