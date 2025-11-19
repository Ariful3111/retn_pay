import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_checkbox.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterAmenities extends StatelessWidget {
  final List amenitiesItems;
  final RxList<String> selectedAmenities;
  final Function(List<String>) onAmenitiesChange;
  final RxBool isShowAmenities;
  final RxBool isAmenities;
  const FilterAmenities({super.key, required this.amenitiesItems, required this.selectedAmenities, required this.onAmenitiesChange, required this.isAmenities, required this.isShowAmenities});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(18.41.h),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(width: 0.77, color: AppColors.filterBorder),
            borderRadius: BorderRadius.circular(9.2.sp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterTitles(title: 'Amenities', onTap: () {
                isAmenities.value =!isAmenities.value; 
              }, isShow: isShowAmenities,),
              FilterCheckbox(propertyItems: amenitiesItems, selectedProperty: selectedAmenities, onChange: onAmenitiesChange)
            ],
          ),
      ),
    );
  }
}