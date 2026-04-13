import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_checkbox.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterAmenities extends StatelessWidget {
  final List<String> amenitiesItems;
  final RxList<String> selectedAmenities;
  final Function(List<String>) onAmenitiesChange;
  final RxBool isShowAmenities;
  final VoidCallback onAmenities;
  const FilterAmenities({
    super.key,
    required this.amenitiesItems,
    required this.selectedAmenities,
    required this.onAmenitiesChange,
    required this.onAmenities,
    required this.isShowAmenities,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      child: Container(
        padding: EdgeInsets.all(18.41.h),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          border: Border.all(
            width: 0.77,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.filterBorder,
          ),
          borderRadius: BorderRadius.circular(9.2.sp),
        ),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterTitles(
                title: 'Amenities',
                onTap: onAmenities,
                icon: isShowAmenities.value ? Icons.remove : Icons.add,
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: isShowAmenities.value ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: isShowAmenities.value
                      ? Column(
                          children: [
                            SizedBox(height: 8.32),
                            Divider(
                              height: 2.h,
                              color: isDark
                                  ? AppColors.darkBorderPrimary
                                  : Color(0xFFE5E9EE),
                            ),
                            FilterCheckbox(
                              propertyItems: amenitiesItems,
                              selectedProperty: selectedAmenities,
                              onChange: onAmenitiesChange,
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
