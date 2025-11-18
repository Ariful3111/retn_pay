import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class PropertySort extends StatelessWidget {
  const PropertySort({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.93.sp),
      height: 56.72.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        border: Border.all(width: 0.74,color: AppColors.filterBorder),
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
                CustomText.primaryText(text: 'Property',fontSize: 16.sp),
                CustomText.secondaryText(text: '---  Showing  result- (12)',fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xFF697483))
              ],
            ),
          ),
          Container(
            height: 44.86.h,
            width: 111.18.w,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.93),
            color: Color(0xFFF4F6F8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.secondaryText(text: 'Sort By',fontSize: 10.sp,fontWeight: FontWeight.w400,color: Color(0xFF697483)),
                    CustomText.secondaryText(text: 'Low to High',fontSize: 12.sp,color: AppColors.darkPrimary),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: SizedBox(
                    height: 17.79.h,
                    width: 17.79.w,
                    child: Center(child: Image.asset(IconsPath.downArrow,height: 3.71.h,width: 7.41.w,color: AppColors.darkPrimary,)),
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