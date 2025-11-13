import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    );
  }
}