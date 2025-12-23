import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class UpcomingPaymentStatus extends StatelessWidget {
  final Widget? widget;
  const UpcomingPaymentStatus({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40.h,
              width: 155.w,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 28,
                    color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CustomTextPrimary(
                    text: 'Status:',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    height: 24.h,
                    width: 77.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: isDark ? Color(0xFF382806) : Color(0xFFFFF7E6),
                    ),
                    child: Center(
                      child: CustomTextPrimary(
                        text: 'Pending',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Color(0xFFFFF7E6) : Color(0xFFE89E00),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ?widget,
          ],
        );
  }
}