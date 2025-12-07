import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GlobalScrollController extends GetxController {
  RxBool isVisible = true.obs;
  void listen(ScrollController scrollController) {
    scrollController.addListener((){
      if (!scrollController.hasClients) return;
    final direction = scrollController.position.userScrollDirection;
    final pixel = scrollController.position.pixels;
    if (direction == ScrollDirection.forward || pixel <= 200) {
      if (!isVisible.value) isVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      if (isVisible.value) isVisible.value = false;
    }
    });
  }

}
