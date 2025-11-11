import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';

class SettingsBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>SettingsController());
  }
}