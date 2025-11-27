import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DashboardController extends GetxController {
  RxBool isFavorite = false.obs;
  Rx<SfRangeValues> range = SfRangeValues(300, 670000).obs;
  double minRange = 0;
  double maxRange = 700000;
  TextEditingController filterSearchController = TextEditingController();
  RxList<String> selectedFilterProperty = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxBool isShowPriceRange = true.obs;
  RxBool isShowAmenities = false.obs;
  RxBool isShowProperty = false.obs;
  RxBool isShowSearch = true.obs;
  List dialogImageList = [
    ImagesPath.house,
    ImagesPath.apartment,
    ImagesPath.office,
    ImagesPath.studio,
    ImagesPath.vila,
  ];
  RxInt dialogImageIndex = 0.obs;
  List<Map<String, dynamic>> drawerItems = [
    {'icon': IconsPath.dashboard, 'title': 'Dashboard'},
    {'icon': IconsPath.drawerInspection, 'title': 'Inspection Request'},
    {'icon': IconsPath.drawerKey, 'title': 'Key Release'},
    {'icon': IconsPath.drawerActive, 'title': 'Active Properties'},
    {'icon': IconsPath.drawerPayment, 'title': 'Payment Management'},
    {'icon': IconsPath.drawerRepair, 'title': 'Repair \$ Maintenance'},
    {'icon': IconsPath.drawerService, 'title': 'Service'},
  ];
  RxBool isItemSelect = false.obs;
  void dialogSelectedIndex(int index) {
    dialogImageIndex.value = index;
  }
}
