import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class CustomFavoriteButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFavorite;
  const CustomFavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: AppColors.whiteColor,
        ),
        child: Center(
          child: Image.asset(
            isFavorite ? IconsPath.selectFavorite : IconsPath.favorite,
            height: isFavorite ? 22.h : 17.h,
            width: isFavorite ? 22.h : 17.h,
          ),
        ),
      ),
    );
  }
}
