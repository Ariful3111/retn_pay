import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class PropertyImageView extends StatelessWidget {
  const PropertyImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.66.sp),
      width: 380.w,
      height: 272.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        children: [
          Container(
            width: 364.w,
            height: 218.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImagesPath.house),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(3.5.sp)
            ),
          )
        ],
      ),
    );
  }
}