import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_settings_repo.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetSettingsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => SettingsController(getSettingsRepository: Get.find()));
  }
}
