import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SfRangeValues range = SfRangeValues(20.0, 80.0);
    return SfRangeSlider(
      values: range,
      min: 0,
      max: 100,
      startThumbIcon: Container(
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
      ),
      endThumbIcon: Container(
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
      ),
      activeColor: AppColors.primaryColorDark,
      inactiveColor: Color(0xFFD1B1C5),
      onChanged: (SfRangeValues value) {},
    );
  }
  
}
