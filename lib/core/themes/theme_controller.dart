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
    isDarkMode.value = loadThemeFromStorage();
    super.onInit();
  }
  void saveThemeToStorage() {
    _box.write(_key, isDarkMode.value);
  }

  
  bool loadThemeFromStorage() {
    return _box.read(_key) ?? false;
  }

  void changeTheme(){
    isDarkMode.value=!isDarkMode.value;
    saveThemeToStorage();
  }
  ThemeData get currentTheme => isDarkMode.value?AppTheme.darkTheme:AppTheme.lightTheme;
}