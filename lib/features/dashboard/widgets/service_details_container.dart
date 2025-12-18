import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class ServiceDetailsContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final double? radius;
  final Widget child;
  const ServiceDetailsContainer({
    super.key,
    this.padding,
    this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      padding: padding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(radius ?? 12.r),
      ),
      child: child,
    );
  }
}
