import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    ThemeController themeController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 48.h,
          width: 326.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              width: 1.sp,
              color: themeController.isDarkMode.value
                  ? AppColors.darkBorderPrimary
                  : AppColors.secondaryBorder,
            ),
            color: themeController.isDarkMode.value
                ? AppColors.darkSecondary
                : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 25.sp,
                spreadRadius: 0,
                color: AppColors.darkPrimary.withValues(alpha: 0.10),
              ),
            ],
          ),
          child: Center(
            child: CustomTextField(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enableBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              controller: homeController.searchController,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.sp),
                child: Image.asset(
                  IconsPath.homeSearch,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              hintText: 'Search...',
              isFilled: false,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Stack(
                  children: [
                    Positioned(
                      top: 110.h,
                      right: 20.w,
                      child: Obx(() {
                        final start = homeController.range.value.start;
                        final end = homeController.range.value.end;
                        return CustomFilter(
                          range: homeController.range.value,
                          min: '\$${start.toInt().toString()}',
                          max: '\$${end.toInt().toString()}',
                          minRange: homeController.minRange,
                          maxRange: homeController.maxRange,
                          onSliderChanged: (SfRangeValues value) {
                            homeController.range.value = value;
                          },
                          textEditingController:
                              homeController.filterSearchController,
                          isSlider: () {},
                          isSearch: () {},
                          propertyItems: [
                            'Apartment',
                            'Studio',
                            'House',
                            'Villa',
                            'Office',
                          ],
                          selectedProperty:
                          homeController.selectedFilterProperty,
                          onPropertyChange: (value) {},
                          amenitiesItems: ['Parking','Pet-friendly','Private pool','Gym/Fitness Center','Garden/Outdoor space','24/7 Security'],
                          selectedAmenities: homeController.selectedAmenities,
                          onAmenitiesChange: (value) {},
                        );
                      }),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(
                width: 1.sp,
                color: themeController.isDarkMode.value
                    ? AppColors.darkBorderPrimary
                    : AppColors.secondaryBorder,
              ),
              gradient: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20.sp,
                  spreadRadius: 0,
                  color: AppColors.darkPrimary.withValues(alpha: 0.10),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                IconsPath.homeFilter,
                height: 18.h,
                width: 18.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
