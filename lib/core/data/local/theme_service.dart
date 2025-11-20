import 'package:get_storage/get_storage.dart';

class ThemeService {
   final _box = GetStorage();
  final _key = 'isDarkMode';
  Future<void> saveThemeToStorage(bool value)async {
   await _box.write(_key, value);
  }
  bool getIsDark(){
    final storeTheme = _box.read<bool>(_key);
    return storeTheme ?? false;
  }
}