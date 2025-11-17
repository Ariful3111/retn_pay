import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  //ThemeData get currentTheme => isDarkMode.value?Brightness.dark:Brightness.light;
}