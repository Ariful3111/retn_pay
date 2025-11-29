import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';

class DashboardController extends GetxController {
  RxBool isFavorite = false.obs;
  RxBool isAutoPay = false.obs;
  ImagePicker picker = ImagePicker();
  Rxn<XFile> upload = Rxn<XFile>();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isQuickActions = false.obs;
  List dialogImageList = [
    ImagesPath.house,
    ImagesPath.apartment,
    ImagesPath.office,
    ImagesPath.studio,
    ImagesPath.vila,
  ];
  RxInt dialogImageIndex = 0.obs;
  List drawerItems = [
    {'icon': IconsPath.dashboard, 'title': 'Dashboard'},
    {'icon': IconsPath.drawerInspection, 'title': 'Inspection Request'},
    {'icon': IconsPath.drawerKey, 'title': 'Key Release'},
    {'icon': IconsPath.drawerActive, 'title': 'Active Properties'},
    {'icon': IconsPath.drawerPayment, 'title': 'Payment Management'},
    {'icon': IconsPath.drawerRepair, 'title': 'Repair \$ Maintenance'},
    {'icon': IconsPath.drawerService, 'title': 'Service'},
  ];
  List dashboardItems = [
    {'icon': IconsPath.dashboardRent, 'title': 'Rents'},
    {'icon': IconsPath.dashboardInspection, 'title': 'Inspections'},
    {'icon': IconsPath.dashboardApplication, 'title': 'Applications'},
    {'icon': IconsPath.dashboardRepair, 'title': 'Repairs'},
  ];
  RxInt isItemSelect = 0.obs;
  void dialogSelectedIndex(int index) {
    dialogImageIndex.value = index;
  }
}
