import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';

void successSnack({
  required String message, 
}) {
  Get.snackbar(
    'Success',
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: AppColors.primaryDarkTextColor,
  );
}

void errorSnack( {
required String message, 
}){
  Get.snackbar(
  'Error',
  message,
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.red,
  colorText: Colors.white,
);
}
