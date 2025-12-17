import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  RxList serviceType = ['Search', 'Booked Services'].obs;
  RxString selectedServiceType = 'Search'.obs;
  RxBool isSelected = false.obs;
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
