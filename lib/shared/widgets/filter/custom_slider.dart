import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSlider extends StatelessWidget {
  final SfRangeValues range;
  final double minRange;
  final double maxRange;
  final ValueChanged<SfRangeValues> onChanged;
  const CustomSlider({super.key, required this.range, required this.minRange, required this.maxRange, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    
    return SfRangeSlider(
      values: range,
      min: minRange,
      max: maxRange,
      startThumbIcon: thumbIcon(),
      endThumbIcon: thumbIcon(),
      activeColor: AppColors.primaryColorDark,
      inactiveColor: Color(0xFFD1B1C5),
      onChanged: onChanged,
    );
  }
  Widget thumbIcon(){
    return Container(
        height: 18.41.h,
        width: 18.41.w,
        decoration: BoxDecoration(
          color: AppColors.primaryTextColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Center(
          child: Container(
            height: 10.74.h,
            width: 10.74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(color: Color(0xFFBB8CA9), width: 1.2.sp),
            ),
            child: Center(
              child: Container(
                height: 6.14.h,
                width: 6.14.w,
                decoration: BoxDecoration(
                 color: Color(0xFFBB8CA9),
                 borderRadius: BorderRadius.circular(5.sp),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
