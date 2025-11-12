import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class SubscriptionContainer extends StatelessWidget {
  final Color? planBG;
  final double? height;
  final double? width;
  final String? planTitle;
  final String? planSubtitle;
  final String? price;
  final String? planIcon;
  final Gradient? planIconBG;
  final List<Widget> widgetList;
  final Widget? stackList;
  final VoidCallback onTap;
  final double? sizeBoxHeight;
  const SubscriptionContainer({
    super.key,
    this.planBG,
    this.height,
    this.width,
    this.planTitle,
    this.planSubtitle,
    this.price,
    this.planIcon,
    required this.widgetList,
    required this.onTap,
    this.stackList,
    this.planIconBG, this.sizeBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      height: height ?? 752.h,
      width: width ?? 390.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        gradient: LinearGradient(
          begin: AlignmentGeometry.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFFFFFBF2).withValues(alpha: 0.0), planBG ?? Color(0xFFFAEAC8)],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.sp),
            blurRadius: 30.sp,
            spreadRadius: 0.sp,
            color: AppColors.primaryDarkTextColor.withValues(alpha: 0.15.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.sp),
                      gradient: planIconBG ?? AppColors.basicIconBG,
                    ),
                    child: Center(
                      child: Image.asset(
                        planIcon ?? IconsPath.basicPlan,
                        height: 34.h,
                        width: 33.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.primaryText(
                        text: planTitle ?? "Basic",
                        color: AppColors.subsPlanTitle,
                        fontSize: 28.sp,
                      ),
                      SizedBox(height: 12.h),
                      CustomText.secondaryText(
                        text: planSubtitle ?? "(Free 15 days for first-time users)",
                        color: AppColors.subsPlanSubtitle,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 16.h),
                      CustomText.spanText(
                        title: price ?? '\$299',
                        spantext: '/month',
                        fontSize: 40.sp,
                        spanFontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        spanFontWeight: FontWeight.w400,
                        color: AppColors.subsPlanTitle,
                        spanColor: AppColors.secondaryTextColor,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(height: 2.h, width: 310.w, color: Color(0xFFDFE2E6)),
              SizedBox(height: 12.h),
              CustomText.secondaryText(text: "Benefits:", color: AppColors.subsPlanTitle),
              SizedBox(height: 14.h),
              Column(children: widgetList),
              SizedBox(height:sizeBoxHeight?? 84.h),
              CustomSecondaryButton(onPressed: onTap, text: "Buy", height: 52.h, width: 286.w),
            ],
          ),
        ],
      ),
    );
  }
}
