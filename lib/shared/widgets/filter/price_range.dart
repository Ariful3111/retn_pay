import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:renter_pay/shared/widgets/filter/custom_slider.dart';

class PriceRange extends StatelessWidget {
  const PriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.h,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.2.sp),
        border: Border.all(width: 0.77.sp,color: Color(0xFFE6E9ED)),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.41.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.primaryText(text: 'Rent Budget',fontSize: 15.34.sp,color: Color(0xFF252B37)),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: 11.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.darkPrimary,width: 1.57.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.74.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.41.w),
            child: Divider(color: Color(0xFFE5E9EE),),
          ),
          CustomSlider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //   showPrice("Min", '300'),
          //   showPrice("Min", '300'),
          // ],),
        ],
      ),
    );
  }
  Widget showPrice(String text,String price){
    return Container(
      height: 41.42.h,
      width: 108.53.w,
      padding: EdgeInsets.symmetric(horizontal: 12.27.w,vertical: 6.14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.14.sp),
        color: Color(0xFFF4F6F8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.secondaryText(text: text,fontSize: 9.2.sp,fontWeight: FontWeight.w400,color: Color(0xFF697483)),
          CustomText.primaryText(text: '\${$price}',fontSize: 12.27.sp,fontWeight: FontWeight.w500),

        ],
      ),
    );
  }
}