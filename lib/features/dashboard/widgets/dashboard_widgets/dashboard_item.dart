import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  const DashboardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(top: 13.68.h, left: 15.86.w),
      height: 85.93.h,
      width: 188.39.w,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 0.66.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 26.44.h,
            width: 26.44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: isDark ? Color(0xFF323133) : Color(0xFFFBF5FF),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 15.86.h,
                width: 15.86.w,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextPrimary(
                text: title,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10.h),
              CustomTextPrimary(
                text: value,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
