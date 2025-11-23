import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/text/custom_text_secondary.dart';

class Category extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;
  const Category({super.key, required this.categoryName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextPrimary(text: categoryName,fontSize: 20.sp,),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
             CustomTextSecondary(text: 'See All',fontSize: 14.sp,color: AppColors.primaryColorDark),
              SizedBox(width: 4.w,),
              Image.asset(IconsPath.forward,height: 10.h,width: 10.w,color: AppColors.primaryColorDark,),
            ],
          ),
        ),
      ],
    );
  }
}