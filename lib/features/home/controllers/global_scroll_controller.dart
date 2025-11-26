import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GlobalScrollController extends GetxController {
  late ScrollController scrollController;
  RxBool isVisible = true.obs;
  void listen() {
    if (!scrollController.hasClients) return;
    final direction = scrollController.position.userScrollDirection;
    final pixel = scrollController.position.pixels;
    if (direction == ScrollDirection.forward || pixel <= 200) {
      if (!isVisible.value) isVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      if (isVisible.value) isVisible.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(listen);
  }
}
