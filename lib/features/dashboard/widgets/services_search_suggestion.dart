import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class ServicesSearchSuggestion extends StatelessWidget {
  final Widget child;
  const ServicesSearchSuggestion({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(6.r),
        width: 243.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.16.r,
            color: isDark ? AppColors.darkBorderPrimary : Color(0xFFF1F1F2),
          ),
          boxShadow: [
            myShadow(dy: 33, radius: 72, alpha: 0.10),
            myShadow(dy: 131, radius: 131, alpha: 0.09),
            myShadow(dy: 296, radius: 177, alpha: 0.05),
            myShadow(dy: 526, radius: 210, alpha: 0.01),
            myShadow(dy: 821, radius: 230, alpha: 0.0),
          ],
        ),
        child: child,
      ),
    );
  }

  BoxShadow myShadow({
    required double dy,
    required double radius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: radius,
      color: AppColors.darkPrimary.withValues(alpha: alpha),
    );
  }
}
