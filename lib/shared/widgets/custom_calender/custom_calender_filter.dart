import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_calender/select_day.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';

class CustomCalenderFilter extends StatelessWidget {
  final Widget widget;
  final int isDay;
  final Function(int index) onTap;
  final AlignmentGeometry? alignmentGeometry;
  final VoidCallback onApply;
  const CustomCalenderFilter({
    super.key,
    required this.widget,
    this.alignmentGeometry,
    required this.isDay,
    required this.onTap,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: alignmentGeometry ?? Alignment(0.5, -0.8),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(9.44.r),
        height: 380.h,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectDay(isDay: isDay, onTap: onTap),
            SizedBox(width: 7.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 320.h, width: 244.w, child: widget),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomSecondaryButton(
                        text: 'Cancel',
                        height: 23.44.h,
                        width: 49.88.w,
                        borderRadius: BorderRadius.circular(3.54.r),
                        fontSize: 9.44.sp,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 11.8),
                      CustomPrimaryButton(
                        height: 23.44.h,
                        width: 44.86.w,
                        borderRadius: BorderRadius.circular(3.54.r),
                        text: 'Apply',
                        fontSize: 9.44.sp,
                        onPressed: onApply,
                      ),
                    ],
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
