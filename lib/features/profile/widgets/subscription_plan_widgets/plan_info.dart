import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class PlanInfo extends StatelessWidget {
  final String? planTitle;
  final String? planSubtitle;
  final String? price;
  final String? spanText;
  final String? planIcon;
  final Gradient? planIconBG;
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final FontWeight? subtitleFontWeight;
  final double? priceFontSize;
  final double? spanFontSize;
  final double? sizeWidth;

  const PlanInfo({
    super.key,
    this.planTitle,
    this.planSubtitle,
    this.price,
    this.spanText,
    this.planIcon,
    this.planIconBG,
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    this.titleFontSize,
    this.subtitleFontSize,
    this.subtitleFontWeight,
    this.priceFontSize,
    this.spanFontSize,
    this.sizeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 56.h,
          width: width ?? 56.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45.sp),
            gradient: planIconBG ?? AppColors.basicIconBG,
          ),
          child: Center(
            child: Image.asset(
              planIcon ?? IconsPath.basicPlan,
              height: iconHeight ?? 34.h,
              width: iconWidth ?? 33.w,
            ),
          ),
        ),
        SizedBox(width: sizeWidth ?? 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextPrimary(
                text: planTitle ?? "Basic",
                color: AppColors.subsPlanTitle,
                fontSize: titleFontSize ?? 28.sp,
              ),
              SizedBox(height: 12.h),
              CustomTextSecondary(
                text: planSubtitle ?? "(Free 15 days for first-time users)",
                color: AppColors.subsPlanSubtitle,
                fontSize: subtitleFontSize ?? 14.sp,
                fontWeight: subtitleFontWeight,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16.h),
              CustomTextSpan(
                title: price ?? '\$299',
                spantext: spanText ?? '/month',
                fontSize: priceFontSize ?? 40.sp,
                spanFontSize: spanFontSize ?? 14.sp,
                fontWeight: FontWeight.w600,
                spanFontWeight: FontWeight.w400,
                color: AppColors.subsPlanTitle,
                spanColor: AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
