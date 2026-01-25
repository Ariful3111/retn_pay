import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/subscription_plan_widgets/plan_info.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SubscriptionContainer extends StatelessWidget {
  final Color? planBG;
  final double? height;
  final double? width;
  final String? planTitle;
  final String? planSubtitle;
  final String? price;
  final String? spanText;
  final String? planIcon;
  final Gradient? planIconBG;
  final List<Widget> widgetList;
  final Widget? stackList;
  final double? sizeBoxHeight;
  final Widget purchaseButton;
  const SubscriptionContainer({
    super.key,
    this.planBG,
    this.height,
    this.width,
    this.planTitle,
    this.planSubtitle,
    this.price,
    this.spanText,
    this.planIcon,
    required this.widgetList,
    this.stackList,
    this.planIconBG,
    this.sizeBoxHeight,
    required this.purchaseButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      width: width ?? 390.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        gradient: LinearGradient(
          begin: AlignmentGeometry.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFFFFBF2).withValues(alpha: 0.5),
            planBG ?? Color(0xFFFAEAC8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
            color: AppColors.primaryDarkTextColor.withValues(alpha: 0.15),
          ),
        ],
      ),
      child: Stack(
        children: [
          ?stackList,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlanInfo(
                planTitle: planTitle ?? "Basic",
                planIcon: planIcon ?? IconsPath.basicPlan,
                planIconBG: planIconBG ?? AppColors.basicIconBG,
                planSubtitle:
                    planSubtitle ?? "(Free 15 days for first-time users)",
                price: price ?? '\$299',
                spanText: spanText ?? '/month',
              ),
              SizedBox(height: 12.h),
              Container(
                height: 2.h,
                width: 310.w,
                color: AppColors.primaryBorder,
              ),
              SizedBox(height: 12.h),
              CustomTextSecondary(
                text: "Benefits:",
                color: AppColors.subsPlanTitle,
              ),
              SizedBox(height: 14.h),
              Column(children: widgetList),
              SizedBox(height: 50.h),
              Center(child: purchaseButton),
            ],
          ),
        ],
      ),
    );
  }
}
