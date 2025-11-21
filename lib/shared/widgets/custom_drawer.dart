import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomDrawer extends StatelessWidget {
  final Color? imageColor;
  final VoidCallback onTap;
  final double? imageHeight;
  final double? imageWidth;
  final String? image;
  const CustomDrawer({super.key, this.imageColor, required this.onTap, this.imageHeight, this.imageWidth, this.image});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
          onTap: onTap,
          child: Image.asset(
            image ?? IconsPath.profileDrawer,
            height: imageHeight ?? 12.h,
            width: imageWidth ?? 18.w,
            color: isDark
                ? imageColor ?? AppColors.darkAppBar
                : imageColor ?? AppColors.primaryTextColor,
          ),
        );
  }
}