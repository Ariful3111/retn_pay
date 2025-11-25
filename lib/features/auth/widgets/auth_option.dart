import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AuthOption extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final Color ? imageColor;
  const AuthOption({super.key, required this.title, required this.image, required this.onTap, this.imageColor});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.84.h,
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color:isDark?AppColors.darkPrimary: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(7.r),
          border: BoxBorder.all(width: 0.87.sp,color:isDark?AppColors.darkBorderPrimary:AppColors.primaryBorder)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,height: 22.h,width: 22.h,color: imageColor,),
            SizedBox(width: 14.w,),
            CustomTextSecondary(text: title,fontSize: 14.sp),
          ],
        ),
      ),
    );
  }
}