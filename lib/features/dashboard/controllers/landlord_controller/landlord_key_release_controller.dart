import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LandlordKeyReleaseController extends GetxController {
  TextEditingController drawController = TextEditingController();
  RxBool isDrawing = false.obs;
  RxString signatureMode = 'draw'.obs;
  RxString typedText = ''.obs;
  RxList<XFile> imageList = <XFile>[].obs;
  @override
  void dispose() {
    drawController.dispose();
    super.dispose();
  }
}
