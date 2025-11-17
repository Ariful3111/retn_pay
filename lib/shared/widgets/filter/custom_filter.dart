import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_amenities.dart';
import 'package:renter_pay/shared/widgets/filter/filter_property.dart';
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
  final ValueChanged<SfRangeValues> onSliderChanged;
  final TextEditingController textEditingController;
  final VoidCallback isSlider;
  final VoidCallback isSearch;
  final List propertyItems;
  final RxList<String> selectedProperty;
  final Function(List<String>) onPropertyChange;
  final List amenitiesItems;
  final RxList<String> selectedAmenities;
  final Function(List<String>) onAmenitiesChange;
  const CustomFilter({
    super.key,
    required this.range,
    required this.min,
    required this.max,
    required this.minRange,
    required this.maxRange,
    required this.textEditingController,
    required this.isSlider,
    required this.isSearch,
    required this.onSliderChanged,
    required this.propertyItems,
    required this.selectedProperty,
    required this.onPropertyChange, required this.amenitiesItems, required this.selectedAmenities, required this.onAmenitiesChange,
  });

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
          SizedBox(height: 8.32),
          PriceRange(
            range: range,
            min: min,
            max: max,
            minRange: minRange,
            maxRange: maxRange,
            onChanged: onSliderChanged,
            onTap: isSlider,
          ),
          SizedBox(height: 8.32),
          FilterSearch(
            textEditingController: textEditingController,
            onTap: isSearch,
          ),
          SizedBox(height: 8.32),
          FilterProperty(
            propertyItems: propertyItems,
            selectedProperty: selectedProperty,
            onChange: onPropertyChange,
          ),
          SizedBox(height: 8.32),
          FilterAmenities(amenitiesItems: amenitiesItems, selectedAmenities: selectedAmenities, onAmenitiesChange: onAmenitiesChange)
        ],
      ),
    );
  }
}
