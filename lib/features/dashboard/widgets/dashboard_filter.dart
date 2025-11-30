import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/select_day.dart';
import 'package:renter_pay/shared/widgets/custom_table_calender.dart';

class DashboardFilter extends StatelessWidget {
  const DashboardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment(0.5, -0.850),
      child: Container(
        padding: EdgeInsets.all(9.44.r),
        height: 275.h,
        width: 360.w,
        decoration: BoxDecoration(
          color: isDark?AppColors.darkPrimary:AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4.72),
              blurRadius: 16.52,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            )
          ],
          borderRadius: BorderRadius.circular(7.08.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectDay(),
              CustomTableCalender(),
            ],
          ),
      ),
    );
  }
}
