import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileEditButton extends StatelessWidget {
  final VoidCallback onTap;
  const ProfileEditButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 41.h,
        width: 86.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(IconsPath.profileEdit, height: 18.h, width: 18.w),
            CustomTextSecondary(
              text: 'Edit',
              fontSize: 14.sp,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
