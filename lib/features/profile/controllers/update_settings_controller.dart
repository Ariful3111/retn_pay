import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';

import 'package:renter_pay/features/profile/repositories/update_settings_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class UpdateSettingsController extends GetxController {
  final UpdateSettingsRepository updateSettingsRepository;
  UpdateSettingsController({required this.updateSettingsRepository});
  RxBool isLoading = false.obs;
  final settingsController = Get.find<SettingsController>();

  Future<void> updateSettings() async {
    isLoading.value = true;
    final response = await updateSettingsRepository.execute(
      pushNotifications: settingsController.isNotification.value,
      autoPayRent: settingsController.isAutoPayment.value,
    );
    isLoading.value = false;
    response.fold((error) {
      ErrorSnackbar.show(description: error.message);
    }, (data) {});
  }
}
