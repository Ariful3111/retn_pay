import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/controllers/update_settings_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_settings_repo.dart';
import 'package:renter_pay/features/profile/repositories/update_settings_repo.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetSettingsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => UpdateSettingsRepository(postWithoutResponse: Get.find()),
    );
    Get.lazyPut(() => SettingsController(getSettingsRepository: Get.find()));
    Get.lazyPut(
      () => UpdateSettingsController(updateSettingsRepository: Get.find()),
    );
  }
}
