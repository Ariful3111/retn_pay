import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatelessWidget {
  const CustomTableCalender({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 221.h,
      width: 244.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark?AppColors.darkSecondary:AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.72),
            blurRadius: 16.52,
            color: AppColors.dropShadowColor.withValues(alpha: .10),
          ),
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
            ],
          ),
        ],
      ),
    );
  }
}