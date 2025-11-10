import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/themes/app_theme.dart';

class ThemeController extends GetxController{
  final _box = GetStorage();
  final _key = 'isDarkMode';
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    isDarkMode.value = _box.read(_key)??false;
    super.onInit();
  }

  void toggleTheme(){
    isDarkMode.value=!isDarkMode.value;
  }
  ThemeData get currentTheme => isDarkMode.value?AppTheme.darkTheme:AppTheme.lightTheme;
}