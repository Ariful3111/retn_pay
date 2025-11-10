import 'package:get/get.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';

class ThemeBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ThemeController());
  }
}