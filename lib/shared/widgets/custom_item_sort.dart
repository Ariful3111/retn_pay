import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomItemSort extends StatelessWidget {
  final String title;
  final VoidCallback onItemSort;
  const CustomItemSort({super.key, required this.title, required this.onItemSort});

  @override
  Widget build(BuildContext context) {
     bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(5.93.sp),
      height: 56.72.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        border: Border.all(width: 0.74,color:isDark?AppColors.darkBorderPrimary: AppColors.filterBorder),
        borderRadius: BorderRadius.circular(8.89.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 44.86.h,
            width: 222.17.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextPrimary(text: title,fontSize: 16.sp),
                CustomTextSecondary(text: '---  Showing  result- (12)',fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xFF697483))
              ],
            ),
          ),
          Container(
            height: 44.86.h,
            width: 111.18.w,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.93),
            color:isDark?Color(0xFF0D0D0D): AppColors.whiteButtonColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CustomTextSecondary(text: 'Sort By',fontSize: 10.sp,fontWeight: FontWeight.w400,color:isDark?AppColors.darkSecondaryText: Color(0xFF697483)),
                  CustomTextSecondary(text: 'Low to High',fontSize: 12.sp,color:isDark?AppColors.darkPrimaryText: AppColors.darkPrimary),
                  ],
                ),
                GestureDetector(
                  onTap: onItemSort,
                  child: SizedBox(
                    height: 17.79.h,
                    width: 17.79.w,
                    child: Center(child: Image.asset(IconsPath.downArrow,height: 3.71.h,width: 7.41.w,color: isDark?AppColors.darkPrimaryText: AppColors.darkPrimary,)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}