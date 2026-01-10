import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_contact.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_report.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_review.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/property/property_details_list.dart';
import 'package:renter_pay/shared/widgets/property/property_key_features.dart';

class PropertyManagementDetailsController extends GetxController {
  List<String> reportColumn = ['Property Address','Condition Report'];
  RxList<bool> isOpenList = <bool>[].obs;
  var rating = 0.0.obs;
  RxBool isAccess = false.obs;
  List<String> title = [
    'Property Details',
    'Key Features & Amenities',
    'Agent Details',
    'Tenant Details',
    'LandLord Review',
    'Property Review',
    'Conditional Report',
  ];
  List<Widget> widgetList = [
    PropertyDetailsList(
      propertyDetails: PropertyDetailsModel(),
    ),
    PropertyKeyFeatures(
      propertyDetails: PropertyDetailsModel(),
    ),
    ActivePropertyContact(),
    ActivePropertyContact(),
    PropertyManagementDetailsReview(),
    PropertyManagementDetailsReview(),
    PropertyManagementDetailsReport(),
  ];

  @override
  void onInit() {
    isOpenList.value = List.generate(title.length, (_) => false);
    super.onInit();
  }
}
