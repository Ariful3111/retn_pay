import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback onTap;
  const FavoriteButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: AppColors.whiteColor,
        ),
        child: Center(
          child: Image.asset(IconsPath.favorite,height: 13.5.h,width: 12.w,),
        ),
      ),
    );
  }
}