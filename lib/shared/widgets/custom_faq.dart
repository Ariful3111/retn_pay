import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomFaq extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isShow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? subFontSize;
  final FontWeight? subFontWeight;
  const CustomFaq({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isShow,
    this.fontSize,
    this.fontWeight,
    this.subFontSize,
    this.subFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextSecondary(
                  text: title,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.primaryTextColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Icon(
                  isShow ? Icons.add : Icons.remove,
                  size: 18.sp,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h,),
         AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            child:isShow? SizedBox.shrink():CustomTextSecondary(
              text: subtitle,
              fontSize: subFontSize ?? 14.sp,
              fontWeight: subFontWeight ?? FontWeight.w400,
              color: isDark
                  ? AppColors.darkSecondaryText
                  : AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
