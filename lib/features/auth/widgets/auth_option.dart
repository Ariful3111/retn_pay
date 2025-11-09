import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class AuthOption extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const AuthOption({super.key, required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.84.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(7.r),
          border: BoxBorder.all(width: 0.87.sp,color:AppColors.primaryBorder)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,height: 22.h,width: 22.h,),
            SizedBox(width: 14.w,),
            CustomText.secondaryText(text: title,fontSize: 14.sp),
          ],
        ),
      ),
    );
  }
}