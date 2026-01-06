import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RepairRequestController extends GetxController {
  RxDouble rating = 1.0.obs;
  TextEditingController reviewController = TextEditingController();
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
