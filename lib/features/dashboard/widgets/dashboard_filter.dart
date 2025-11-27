import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DashboardFilter extends StatelessWidget {
  const DashboardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Align(
      alignment: Alignment(0.8, -0.6),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: 260.w,
        ),
        child: Obx(() {
          final start = dashboardController.range.value.start;
          final end = dashboardController.range.value.end;
          return CustomFilter(
            range: dashboardController.range.value,
            min: '\$${start.toInt().toString()}',
            max: '\$${end.toInt().toString()}',
            minRange: dashboardController.minRange,
            maxRange: dashboardController.maxRange,
            onSliderChanged: (SfRangeValues value) {
              dashboardController.range.value = value;
            },
            textEditingController: dashboardController.filterSearchController,
            isSlider: () {dashboardController.isShowPriceRange.value=!dashboardController.isShowPriceRange.value;},
            isSearch: () {dashboardController.isShowSearch.value=!dashboardController.isShowSearch.value;},
            propertyItems: [
              'Apartment',
              'Studio',
              'House',
              'Villa',
              'Office',
            ],
            selectedProperty: dashboardController.selectedFilterProperty,
            onPropertyChange: (value) {},
            amenitiesItems: [
              'Parking',
              'Pet-friendly',
              'Private pool',
              'Gym/Fitness Center',
              'Garden/Outdoor space',
              '24/7 Security',
            ],
            selectedAmenities: dashboardController.selectedAmenities,
            onAmenitiesChange: (value) {},
            onReset: () {},
            isProperty: () {dashboardController.isShowProperty.value=!dashboardController.isShowProperty.value;},
            onAmenities: (){dashboardController.isShowAmenities.value=!dashboardController.isShowAmenities.value;},
            isShowAmenities: dashboardController.isShowAmenities,
            isShowProperty: dashboardController.isShowProperty,
            isShowSearch: dashboardController.isShowSearch,
            isShowPriceRange: dashboardController.isShowPriceRange,
          );
        }),
      ),
    );
  }
}
