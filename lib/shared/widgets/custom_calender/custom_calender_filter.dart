import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_calender/select_day.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class CustomCalenderFilter extends StatelessWidget {
  final Widget widget;
  const CustomCalenderFilter({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment(0.5, -0.850),
      child: Container(
        padding: EdgeInsets.all(9.44.r),
        height: 350.h,
        width: 360.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4.72),
              blurRadius: 16.52,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            ),
          ],
          borderRadius: BorderRadius.circular(7.08.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectDay(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 270.h,
                  width: 244.w,
                  child: widget,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomSecondaryButton(
                      text: 'Cancel',
                      height: 23.44.h,
                      width: 49.88.w,
                      borderRadius: BorderRadius.circular(3.54.r),
                      fontSize: 9.44.sp,
                      onPressed: () {Navigator.pop(context);},
                    ),
                    SizedBox(width: 11.8),
                    CustomPrimaryButton(
                      height: 23.44.h,
                      width: 44.86.w,
                      borderRadius: BorderRadius.circular(3.54.r),
                      text: 'Apply',
                      fontSize: 9.44.sp,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
