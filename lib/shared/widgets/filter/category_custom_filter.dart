import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_amenities.dart';
import 'package:renter_pay/shared/widgets/filter/filter_search.dart';
import 'package:renter_pay/shared/widgets/filter/price_range.dart';
import 'package:renter_pay/shared/widgets/filter/reset_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CategoryCustomFilter extends StatefulWidget {
  final SfRangeValues range;
  final String min;
  final String max;
  final double minRange;
  final double maxRange;
  final ValueChanged<SfRangeValues> onSliderChanged;
  final TextEditingController textEditingController;
  final VoidCallback isSlider;
  final VoidCallback isSearch;
  final List<String> amenitiesItems;
  final RxList<String> selectedAmenities;
  final Function(List<String>) onAmenitiesChange;
  final VoidCallback onReset;
  final VoidCallback onAmenities;
  final RxBool isShowAmenities;
  final RxBool isShowSearch;
  final RxBool isShowPriceRange;
  final VoidCallback? onFilterDispose;

  const CategoryCustomFilter({
    super.key,
    required this.range,
    required this.min,
    required this.max,
    required this.minRange,
    required this.maxRange,
    required this.onSliderChanged,
    required this.textEditingController,
    required this.isSlider,
    required this.isSearch,
    required this.amenitiesItems,
    required this.selectedAmenities,
    required this.onAmenitiesChange,
    required this.onReset,
    required this.onAmenities,
    required this.isShowAmenities,
    required this.isShowSearch,
    required this.isShowPriceRange,
    this.onFilterDispose,
  });

  @override
  State<CategoryCustomFilter> createState() => _CategoryCustomFilterState();
}

class _CategoryCustomFilterState extends State<CategoryCustomFilter> {
  @override
  void dispose() {
    if (widget.onFilterDispose != null) {
      widget.onFilterDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 260.w,
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reset Filter
              ResetFilter(onTap: widget.onReset),
              SizedBox(height: 8.32),
              // Price Range
              PriceRange(
                range: widget.range,
                min: widget.min,
                max: widget.max,
                minRange: widget.minRange,
                maxRange: widget.maxRange,
                onChanged: widget.onSliderChanged,
                onTap: widget.isSlider,
                isPriceShow: widget.isShowPriceRange,
              ),
              SizedBox(height: 8.32),
              // Suburb/Address Search
              FilterSearch(
                textEditingController: widget.textEditingController,
                onTap: widget.isSearch,
                isSearchShow: widget.isShowSearch,
              ),
              SizedBox(height: 8.32),
              // Amenities (No Property Type here)
              FilterAmenities(
                amenitiesItems: widget.amenitiesItems,
                selectedAmenities: widget.selectedAmenities,
                onAmenitiesChange: widget.onAmenitiesChange,
                onAmenities: widget.onAmenities,
                isShowAmenities: widget.isShowAmenities,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
