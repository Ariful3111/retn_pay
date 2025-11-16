import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:renter_pay/shared/widgets/filter/custom_slider.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRange extends StatelessWidget {
  final SfRangeValues range;
  final String min;
  final String max;
  final double minRange;
  final double maxRange;
  final ValueChanged<SfRangeValues> onChanged;
  final VoidCallback onTap;
  const PriceRange({super.key, required this.range, required this.min, required this.max, required this.minRange, required this.maxRange, required this.onChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.25.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.2.sp),
        border: Border.all(width: 0.77.sp,color: AppColors.filterBorder),
      ),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilterTitles(title: 'Rent Budget', onTap: onTap,),
          CustomSlider(range: range, minRange: minRange, maxRange: maxRange, onChanged: onChanged,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.41.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              showPrice("Minimum", min),
              showPrice("Maximum", max),
            ],),
          ),
        ],
      ),
    );
  }
  Widget showPrice(String text,String price){
    return Container(
      height: 45.h,
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
          CustomText.primaryText(text: price,fontSize: 12.27.sp,fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}