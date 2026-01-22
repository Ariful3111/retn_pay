import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/landlord_widgets/dashboard_landlord_plan_container.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/subscription_confirm_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class DashboardLandlordPlan extends StatelessWidget {
  const DashboardLandlordPlan({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 37.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          myShadow(dy: 282, alpha: 0.10),
          myShadow(dy: 1130, alpha: 0.09),
          myShadow(dy: 2542, alpha: 0.05),
          myShadow(dy: 4520, alpha: 0.01),
          myShadow(dy: 7062, alpha: 0.0),
        ],
      ),
      child: Column(
        children: [
          CustomTextPrimary(
            text: 'Upgrade to Silver Plan',
            fontSize: 24.sp,
            color: AppColors.primaryColorDark,
          ),
          SizedBox(height: 8.h),
          CustomTextSecondary(
            text: 'Upgrade your plan to unlock more features',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          DashboardLandlordPlanContainer(),
          SizedBox(height: 24.h),
          CustomPrimaryButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SubscriptionConfirmDialog();
                },
              );
            },
            height: 48.h,
            width: 155.w,
            text: 'Upgrade Now',
          ),
        ],
      ),
    );
  }

  myShadow({required double dy, required double alpha}) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: 250,
      color: AppColors.darkPrimary.withValues(alpha: alpha),
    );
  }
}
