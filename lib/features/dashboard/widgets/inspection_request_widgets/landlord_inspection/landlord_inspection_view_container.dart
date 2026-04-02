import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class LandlordInspectionViewContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const LandlordInspectionViewContainer({
    super.key,
    required this.child,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: padding ?? EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}
