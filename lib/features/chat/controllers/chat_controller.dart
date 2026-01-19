import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class ChatController extends GetxController {
  RxBool isActive = false.obs;
  TextEditingController searchController = TextEditingController();

  final scrollController = ScrollController();
  RxInt selectItem = 0.obs;
  List item = [
    {'icon': IconsPath.active, 'text': 'Active'},
    {'icon': IconsPath.archive, 'text': 'Archive'},
  ];
  @override
  void onInit() {
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
