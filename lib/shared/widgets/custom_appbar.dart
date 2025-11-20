import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class CustomAppbar extends StatelessWidget {
  final String? image;
  final String title;
  final double? imageHeight;
  final double? imageWidth;
  final Widget? secondaryWidget;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? imageColor;
  final VoidCallback onTap;
  const CustomAppbar({
    super.key,
    this.image,
    required this.title,
    this.imageHeight,
    this.imageWidth,
    this.secondaryWidget,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.onTap,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            image ?? IconsPath.profileDrawer,
            height: imageHeight ?? 12.h,
            width: imageWidth ?? 18.w,
            color: isDark
                ? imageColor ?? AppColors.darkAppBar
                : imageColor ?? AppColors.primaryTextColor,
          ),
        ),
        SizedBox(width: 8.w),
        CustomTextPrimary(
          text: title,
          fontSize: fontSize ?? 20.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: isDark
              ? textColor ?? AppColors.darkAppBar
              : textColor ?? AppColors.primaryTextColor,
        ),
        Spacer(),
        ?secondaryWidget,
      ],
    );
  }
}
