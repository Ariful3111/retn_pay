import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class DocumentUploadButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? iconHeight;
  final double? iconWidth;
  final double? height;
  final double? width;
  final double? borderWidth;
  final double? radius;
  final Color? borderColor;
  const DocumentUploadButton({
    super.key,
    required this.onTap,
    this.iconHeight,
    this.iconWidth,
    this.borderWidth,
    this.radius,
    this.borderColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60.h,
        width: width ?? 60.w,
        decoration: BoxDecoration(
          color:isDark? AppColors.darkSecondary:AppColors.whiteColor,
          border: Border.all(
            width: borderWidth ?? 1.15.sp,
            color: borderColor ?? AppColors.primaryBorder,
          ),
          borderRadius: BorderRadius.circular(radius ?? 4.62.sp),
        ),
        child: Center(
          child: Image.asset(
            IconsPath.upload,
            height: iconHeight ?? 23.h,
            width: iconWidth ?? 20.w,
          ),
        ),
      ),
    );
  }
}
