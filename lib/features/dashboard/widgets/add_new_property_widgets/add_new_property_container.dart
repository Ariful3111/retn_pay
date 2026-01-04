import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';

class AddNewPropertyContainer extends StatelessWidget {
  final Widget child;
  const AddNewPropertyContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: child,
    );
  }
}
