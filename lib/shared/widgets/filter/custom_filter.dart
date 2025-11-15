import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/price_range.dart';
import 'package:renter_pay/shared/widgets/filter/reset_filter.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 925.h,
      width: 260.w,
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResetFilter(),
          SizedBox(height: 8.32,),
          PriceRange(),
        ],
      ),
    );
  }
}