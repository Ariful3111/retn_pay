import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class DashboardLandlordQuickActionModel extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String buttonText;
  const DashboardLandlordQuickActionModel({super.key, required this.icon, required this.title, required this.subTitle, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 41.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(icon, height: 40.h, width: 40.h),
              SizedBox(width: 12.w),
              CustomTextPrimary(text: title, fontSize: 20.sp),
            ],
          ),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: subTitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 24.h),
          CustomPrimaryButton(onPressed: onTap, height: 48.h, text: buttonText,fontSize: 14.sp,),
        ],
      ),
    );
  }
}
