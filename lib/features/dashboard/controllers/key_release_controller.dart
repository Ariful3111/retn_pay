import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:signature/signature.dart';

class KeyReleaseController extends GetxController {
  TextEditingController drawController = TextEditingController();
  RxString signatureMode = 'draw'.obs;
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: AppColors.darkPrimary,
  );
  RxString typedText = ''.obs;
  @override
  void dispose() {
    signatureController.dispose();
    drawController.dispose();
    super.dispose();
  }
}
