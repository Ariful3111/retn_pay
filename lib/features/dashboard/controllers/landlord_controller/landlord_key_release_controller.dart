import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:signature/signature.dart';

class LandlordKeyReleaseController extends GetxController {
  TextEditingController drawController = TextEditingController();
  RxBool isDrawing = false.obs;
  RxString signatureMode = 'draw'.obs;
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: AppColors.darkPrimary,
  );
  RxString typedText = ''.obs;
  RxList<String> imageList = <String>[].obs;
  @override
  void dispose() {
    signatureController.dispose();
    drawController.dispose();
    super.dispose();
  }
}
