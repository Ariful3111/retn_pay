import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyReleaseController extends GetxController {
  TextEditingController drawController = TextEditingController();
  RxBool isDrawing = false.obs;
  RxString signatureMode = 'draw'.obs;
  RxString typedText = ''.obs;
  @override
  void dispose() {
    drawController.dispose();
    super.dispose();
  }
}
