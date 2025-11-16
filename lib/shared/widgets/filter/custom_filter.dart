import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_search.dart';
import 'package:renter_pay/shared/widgets/filter/price_range.dart';
import 'package:renter_pay/shared/widgets/filter/reset_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomFilter extends StatelessWidget {
  final SfRangeValues range;
  final String min;
  final String max;
  final double minRange;
  final double maxRange;
  final ValueChanged<SfRangeValues> onChanged;
  final TextEditingController textEditingController;
  final VoidCallback isSlider;
  final VoidCallback isSearch;
  const CustomFilter({super.key, required this.range, required this.min, required this.max, required this.minRange, required this.maxRange, required this.onChanged, required this.textEditingController, required this.isSlider, required this.isSearch});

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
          PriceRange(range: range, min: min, max: max, minRange: minRange, maxRange: maxRange, onChanged: onChanged, onTap: isSlider,),
          SizedBox(height: 8.32,),
          FilterSearch(textEditingController: textEditingController, onTap: isSearch,),
        ],
      ),
    );
  }
}