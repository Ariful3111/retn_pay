import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceBookedDetailsController extends GetxController {
  RxBool isShowInfo = false.obs;
  RxInt widgetIndex = (-1).obs;
  RxDouble rating = 1.0.obs;
  TextEditingController reviewController = TextEditingController();
}
