import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  RxList<String> serviceType = ['Services', 'Booked Services'].obs;
  RxString selectedServiceType = 'Services'.obs;
  RxBool isSelected = false.obs;
  RxBool isSearchFocus = false.obs;
  TextEditingController searchController = TextEditingController();
  List<String> serviceList = <String>[
    'Plumbing',
    'Wall Painting',
    'Roofing Maintenance',
    'Ac Repair',
  ];
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
