import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Align(
      alignment: Alignment(0.8, -0.1),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: 260.w,
        ),
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
            textEditingController: homeController.filterSearchController,
            isSlider: () {
              homeController.isShowPriceRange.value =
                  !homeController.isShowPriceRange.value;
            },
            isSearch: () {
              homeController.isShowSearch.value =
                  !homeController.isShowSearch.value;
            },
            propertyItems: ['Apartment', 'Studio', 'House', 'Villa', 'Office'],
            selectedProperty: homeController.selectedFilterProperty,
            onPropertyChange: (value) {},
            amenitiesItems: [
              'Parking',
              'Pet-friendly',
              'Private pool',
              'Gym/Fitness Center',
              'Garden/Outdoor space',
              '24/7 Security',
            ],
            selectedAmenities: homeController.selectedAmenities,
            onAmenitiesChange: (value) {},
            onReset: () {},
            isProperty: () {
              homeController.isShowProperty.value =
                  !homeController.isShowProperty.value;
            },
            onAmenities: () {
              homeController.isShowAmenities.value =
                  !homeController.isShowAmenities.value;
            },
            isShowAmenities: homeController.isShowAmenities,
            isShowProperty: homeController.isShowProperty,
            isShowSearch: homeController.isShowSearch,
            isShowPriceRange: homeController.isShowPriceRange,
            onFilterDispose: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                homeController.getProperties();
              });
            },
          );
        }),
      ),
    );
  }
}
