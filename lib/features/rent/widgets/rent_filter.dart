// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
// import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
// import 'package:renter_pay/shared/widgets/filter/custom_filter.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';

// class RentFilter extends StatelessWidget {
//   const RentFilter({super.key});

//   @override
//   Widget build(BuildContext context) {
//         RentController rentController = Get.find();
//         final propertyAddressController =
//             Get.isRegistered<PropertyAddressController>()
//                 ? Get.find<PropertyAddressController>()
//                 : null;
//     return Align(
//       alignment: Alignment(0.8, -0.7),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxHeight: MediaQuery.of(context).size.height * 0.8,
//           maxWidth: 260.w,
//         ),
//         child: Obx(() {
//           final start = rentController.range.value.start;
//           final end = rentController.range.value.end;
//           return CustomFilter(
//             range: rentController.range.value,
//             min: '\$${start.toInt().toString()}',
//             max: '\$${end.toInt().toString()}',
//             minRange: rentController.minRange,
//             maxRange: rentController.maxRange,
//             onSliderChanged: (SfRangeValues value) {
//               rentController.range.value = value;
//             },
//             textEditingController: propertyAddressController?.addressController ??
//                 rentController.filterSearchController,
//             isSlider: () {
//               rentController.isShowPriceRange.value =!rentController.isShowPriceRange.value;
//             },
//             isSearch: () {
//               rentController.isShowSearch.value =!rentController.isShowSearch.value;
//             },
//             propertyItems: [
//               'Apartment',
//               'Studio',
//               'House',
//               'Villa',
//               'Office',
//             ],
//             selectedProperty: rentController.selectedFilterProperty,
//             onPropertyChange: (value) {},
//             amenitiesItems: [
//               'Parking',
//               'Pet-friendly',
//               'Private pool',
//               'Gym/Fitness Center',
//               'Garden/Outdoor space',
//               '24/7 Security',
//             ],
//             selectedAmenities: rentController.selectedAmenities,
//             onAmenitiesChange: (value) {},
//             onReset: () {},
//             isProperty: () {rentController.isShowProperty.value =!rentController.isShowProperty.value;},
//             onAmenities: () {rentController.isShowAmenities.value =!rentController.isShowAmenities.value;},
//             isShowAmenities: rentController.isShowAmenities,
//             isShowProperty: rentController.isShowProperty,
//             isShowSearch: rentController.isShowSearch,
//             isShowPriceRange: rentController.isShowPriceRange,
//           );
//         }),
//       ),
//     );
//   }
// }
