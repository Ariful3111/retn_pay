import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/plan_info.dart';

class DashboardLandlordPlanContainer extends StatelessWidget {
  final String planName;
  final String details;
  final String amount;
  const DashboardLandlordPlanContainer({
    super.key,
    required this.planName,
    required this.details,
    required this.amount,
  });

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
            Color(0xFFFFF2FA).withValues(alpha: 1),
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
      child: PlanInfo(
        planIcon: IconsPath.silverPlan,
        planIconBG: AppColors.silverIconBG,
        planTitle: planName,
        price: '\$$amount',
        planSubtitle: details,
      ),
    );
  }
}
