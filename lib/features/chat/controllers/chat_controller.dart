import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/chat/controllers/p2p_chat_list_controller.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class ChatController extends GetxController {
  RxBool isActive = false.obs;
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  final scrollController = ScrollController();
  RxInt selectItem = 0.obs;
  List item = [
    {'icon': IconsPath.active, 'text': 'Active'},
    {'icon': IconsPath.archive, 'text': 'Archive'},
  ];

  void onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 450), () {
      if (!Get.isRegistered<P2PChatListController>()) return;
      Get.find<P2PChatListController>().refreshList();
    });
  }

  @override
  void onInit() {
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
