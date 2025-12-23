import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_contact.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_review.dart';
import 'package:renter_pay/shared/widgets/property/property_details_list.dart';
import 'package:renter_pay/shared/widgets/property/property_key_features.dart';

class ActivePropertyController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;
  TextEditingController reviewController = TextEditingController();
  var rating = 0.0.obs;
  List<String> title = [
    'Property Details',
    'Key Features & Amenities',
    'LandLord Details',
    'Agent Details',
    'Property Review',
  ];
  List<Widget> widgetList = [
    PropertyDetailsList(),
    PropertyKeyFeatures(),
    ActivePropertyContact(),
    ActivePropertyContact(),
    ActivePropertyReview(),
  ];
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    super.onInit();
  }
}
