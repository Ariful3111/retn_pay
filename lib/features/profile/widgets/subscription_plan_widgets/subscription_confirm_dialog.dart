import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/plan_info.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SubscriptionConfirmDialog extends StatelessWidget {
  const SubscriptionConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      height: 635.h,
      title1: 'Confirm Your Subscription',
      subtitle:
          'Review your selected plan and complete\npayment to get started.',
      button: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 19.63.h, bottom: 19.63.h, left: 10.w),
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFFF2FA).withValues(alpha: 0.0),
                  AppColors.basicPlanBG,
                ],
              ),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3.28),
                  blurRadius: 14.58,
                  color: AppColors.darkPrimary.withValues(alpha: 0.15),
                ),
              ],
            ),
            child: PlanInfo(
              height: 45.88.h,
              width: 45.88.w,
              iconHeight: 27.h,
              iconWidth: 28.w,
              titleFontSize: 24.sp,
              subtitleFontSize: 12.sp,
              subtitleFontWeight: FontWeight.w400,
              sizeWidth: 9.w,
              priceFontSize: 32.sp,
              spanFontSize: 12.sp,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextSecondary(
                text: 'View included benefits',
                color: AppColors.primaryColorDark,
              ),
              SizedBox(width: 4.w),
              Image.asset(IconsPath.arrowDown, height: 20.h, width: 20.w),
            ],
          ),
          SizedBox(height: 12.h),
          CustomTextSecondary(
            text: 'You can upgrade or cancel anytime from your dashboard.',
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5D6B82),
          ),
          SizedBox(height: 16.h),
          CustomTextPrimary(
            text: 'Your Balance',
            fontSize: 24.sp,
            color: AppColors.primaryColorDark,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IconsPath.chipLogo, height: 20.h, width: 20.w),
              SizedBox(width: 5.w),
              CustomTextPrimary(
                text: '1200',
                fontSize: 24.sp,
                color: AppColors.darkContainer,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CustomPrimaryButton(
            onPressed: () {},
            height: 40.h,
            width: 186.w,
            borderRadius: BorderRadius.circular(6.r),
            text: 'Confirm & Subscribe',
          ),
        ],
      ),
    );
  }
}
