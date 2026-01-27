import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/shared/widgets/filter/filter_checkbox.dart';
import 'package:renter_pay/shared/widgets/filter/filter_titles.dart';

class FilterProperty extends StatelessWidget {
  final List<String> propertyItems;
  final RxList<String> selectedProperty;
  final Function(List<String>) onChange;
  final VoidCallback onTap;
  final RxBool isPropertyShow;
  const FilterProperty({
    super.key,
    required this.propertyItems,
    required this.selectedProperty,
    required this.onChange,
    required this.onTap,
    required this.isPropertyShow,
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
                title: 'Property Type',
                onTap: onTap,
                icon: isPropertyShow.value ? Icons.remove : Icons.add,
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: isPropertyShow.value ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: isPropertyShow.value
                      ? FilterCheckbox(
                          propertyItems: propertyItems,
                          selectedProperty: selectedProperty,
                          onChange: onChange,
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
