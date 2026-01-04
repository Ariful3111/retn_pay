import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class DashboardLandlordPlanContainer extends StatelessWidget {
  const DashboardLandlordPlanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.65.r),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFFF2FA).withValues(alpha: 0.0),
                  AppColors.silverPlanBG,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.53),
                  blurRadius: 26.48,
                  color: AppColors.darkPrimary.withValues(alpha: 0.0),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 49.43.h,
                  width: 49.43.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.sp),
                    gradient: AppColors.silverIconBG,
                  ),
                  child: Center(
                    child: Image.asset(
                      IconsPath.silverPlan,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomTextPrimary(
                      text: 'Silver',
                      fontSize: 24.sp,
                      color: AppColors.darkContainer,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextSecondary(
                      text: '(Free 15 days for first-time users)',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subsPlanSubtitle,
                    ),
                    SizedBox(height: 14.h),
                    CustomTextSpan(
                      title: '\$799',
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkContainer,
                      spantext: '/month',
                      spanColor: AppColors.secondaryTextColor,
                      spanFontSize: 14.sp,
                      spanFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}