import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomFaq extends StatelessWidget {
  final  String title;
   final  String subtitle;
   final  VoidCallback onTap;
   final  bool isShow;
  const CustomFaq({super.key, required this.title, required this.subtitle, required this.onTap, required this.isShow});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextSecondary(text: title, color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                isShow ? Icons.add : Icons.remove,
                size: 15.sp,
                color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.w,),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          child: CustomTextSecondary(
            text: subtitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color:isDark?AppColors.darkSecondaryText: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}