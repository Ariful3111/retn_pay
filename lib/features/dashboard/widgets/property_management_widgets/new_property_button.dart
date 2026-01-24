import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

import '../../../../core/constants/icons_path.dart';

add({
    required BuildContext context,
    required VoidCallback onTap,
    required String text,
    double? height,
    double? width,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            width: 1.r,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.primaryBorder,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: AppColors.dropShadowColor.withValues(alpha: 0.06),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(IconsPath.add, height: 24.h, width: 24.w),
            SizedBox(width: 4.w,),
            CustomTextSecondary(text: text),
          ],
        ),
      ),
    );
  }