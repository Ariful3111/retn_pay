import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class ServiceDetailsSwitcher extends StatelessWidget {
  final bool isShow;
  final VoidCallback onTap;
  const ServiceDetailsSwitcher({
    super.key,
    required this.isShow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: Center(
          child: Image.asset(
            isShow ? IconsPath.upArrow : IconsPath.downArrow,
            height: 15.h,
            width: 15.w,
            color:isDark? AppColors.darkAppBar:AppColors.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
