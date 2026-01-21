import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class NavChat extends StatelessWidget {
  final bool isColor;
  final bool itemCount;
  const NavChat({super.key, required this.isColor, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeGradient: badges.BadgeGradient.linear(
          begin: Alignment.center,
          end: Alignment.center,
          colors: [Color(0xFF92045A), Color(0xFFAC1972)],
        ),
      ),
      position: badges.BadgePosition.topStart(start: 10, top: -10),
      badgeContent: CustomTextSecondary(
        text: '3',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      child: Image.asset(
        IconsPath.chat,
        height: 24.h,
        width: 24.w,
        color: isColor
            ? itemCount
                  ? AppColors.primaryColorDark
                  : isDark
                  ? AppColors.darkPrimaryText
                  : AppColors.secondaryTextColor
            : null,
      ),
    );
  }
}
