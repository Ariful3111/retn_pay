import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryDarkTextColor.withValues(alpha: 0.05),
            AppColors.primaryDarkTextColor.withValues(alpha: 0.2),
            AppColors.primaryDarkTextColor.withValues(alpha: 0.3),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 20,
            color: AppColors.dropShadowColor.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}
