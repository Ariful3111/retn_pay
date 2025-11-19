import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_checkbox.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterProperty extends StatelessWidget {
  final List propertyItems;
  final RxList<String> selectedProperty;
  final Function(List<String>) onChange;
  final VoidCallback onTap;
  final RxBool isPropertyShow;
  const FilterProperty({
    super.key,
    required this.propertyItems,
    required this.selectedProperty,
    required this.onChange, required this.onTap, required this.isPropertyShow,
    
  });
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
            FilterTitles(title: 'Property Type', onTap: onTap, isShow: isPropertyShow,),
            FilterCheckbox(propertyItems: propertyItems, selectedProperty: selectedProperty, onChange: onChange),
          ],
        ),
      ),
    );
  }
}
