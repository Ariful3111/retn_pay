import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/widgets/price_range.dart';
import 'package:renter_pay/features/rent/widgets/reset_filter.dart';

class RentFilter extends StatelessWidget {
  const RentFilter({super.key});

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