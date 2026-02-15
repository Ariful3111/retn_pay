import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';

class ServiceBookedDetailsController extends GetxController {
  RxBool isShowInfo = false.obs;
  RxList<XFile> imageList = <XFile>[].obs;
  RxList<bool> selectedWidgetList = <bool>[].obs;
  RxDouble rating = 1.0.obs;
  TextEditingController reviewController = TextEditingController();
  @override
  void onInit() {
    selectedWidgetList.value = List.generate(
      Get.find<ServiceSearchController>().widgetList.length,
      (_) => false,
    );
    super.onInit();
  }
}
