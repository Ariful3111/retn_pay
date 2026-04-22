import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomReminder extends StatelessWidget {
  final String title;
  final String date;
  final String detail;
  final String? icon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback onTap;
  const CustomReminder({
    super.key,
    required this.title,
    required this.date,
    required this.detail,
    required this.onTap,
    this.icon,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(13.07.r),
        margin: margin ?? EdgeInsets.only(bottom: 13.07.h),
        height: 145.86.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(13.07.sp),
          border: Border.all(
            color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
            width: 1.09,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
              blurRadius: 5,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              icon ?? IconsPath.reminder,
              height: 26.15.h,
              width: 26.15.w,
            ),
            SizedBox(width: 14.16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextSecondary(
                    text: title,
                    color: isDark
                        ? AppColors.darkAppBar
                        : AppColors.darkContainer,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: CustomTextSecondary(
                      text: detail,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomTextSecondary(
                    text: date,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColorDark,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
