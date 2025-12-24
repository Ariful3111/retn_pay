import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:renter_pay/core/constants/colors.dart';

class ButtonLoading extends StatelessWidget {
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? loadingColor;
  final double? loadingSize;
  const ButtonLoading({
    super.key,
    this.verticalPadding,
    this.horizontalPadding,
    this.loadingColor,
    this.loadingSize,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var spinkit = SpinKitThreeBounce(
      color:
          loadingColor ??
          (isDark ? AppColors.whiteColor : AppColors.primaryColorDark),
      size: loadingSize ?? 30.0.sp,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 0,
        horizontal: horizontalPadding ?? 0,
      ),
      child: Center(child: spinkit),
    );
  }
}
