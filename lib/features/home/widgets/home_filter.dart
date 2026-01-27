import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeFilter extends StatelessWidget {
  final PropertyAddressController propertyAddressController;
  const HomeFilter({super.key, required this.propertyAddressController});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    PropertyCategoryController categoryController = Get.find();
    PropertyAmenitiesController amenitiesController = Get.find();
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
            textEditingController: propertyAddressController.addressController,
            isSlider: () {
              homeController.isShowPriceRange.value =
                  !homeController.isShowPriceRange.value;
            },
            isSearch: () {
              homeController.isShowSearch.value =
                  !homeController.isShowSearch.value;
            },
            propertyItems: categoryController.filterPropertyNames,
            selectedProperty: categoryController.filterSelectedNames,
            onPropertyChange: categoryController.onFilterPropertyChanged,
            amenitiesItems: amenitiesController.filterAmenitiesNames,
            selectedAmenities: amenitiesController.filterSelectedNames,
            onAmenitiesChange: amenitiesController.onFilterAmenitiesChanged,
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
