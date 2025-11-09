import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class UserButton extends StatelessWidget {
  final VoidCallback backOnTap;
  final VoidCallback continueOnTap;
  const UserButton({super.key, required this.backOnTap, required this.continueOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSecondaryButton(
          height: 52.h,
          width: 156.w,
          boxDecoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            border: BoxBorder.all(color: Color(0xFFE2E4E9), width: 1.sp),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 2.r,
                color: Color(0xFF525866).withValues(alpha: 0.06.sp),
              ),
            ],
          ),

          onPressed: backOnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IconsPath.userBack, width: 20.w, height: 20.h),
              SizedBox(width: 8.w),
              CustomText.secondaryText(text: "back", color: Color(0xFF525866)),
            ],
          ),
        ),
        CustomPrimaryButton(
          height: 52.h,
          width: 182.w,
          boxDecoration: BoxDecoration(
            gradient: AppColors.primaryColor,
            
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.sp, 0.sp),
                blurRadius: 0.r,
                spreadRadius: 1.r,
                color: Color(0xFF6E3FF3),
              ),
              BoxShadow(
                offset: Offset(0.sp, 1.sp),
                blurRadius: 2.r,
                spreadRadius: 0.r,
                color: Color(0xFF5A36BF).withValues(alpha: 0.48),
              ),
            ],
          ),
          onPressed: continueOnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.primaryText(text: "Continue",color: AppColors.whiteColor,fontSize: 16.sp,fontWeight: FontWeight.w500),
              SizedBox(width: 4.w,),
              Image.asset(IconsPath.forward,width: 32.w,height: 18.h,)
            ],
          ),
        ),
      ],
    );
  }
}
