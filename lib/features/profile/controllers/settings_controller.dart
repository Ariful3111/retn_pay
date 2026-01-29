import 'package:get/get.dart';
import 'package:renter_pay/features/profile/repositories/get_settings_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class SettingsController extends GetxController {
  final GetSettingsRepository getSettingsRepository;
  SettingsController({required this.getSettingsRepository});
  RxBool isLoading = true.obs;
  RxBool isNotification = false.obs;
  RxBool isAutoPayment = false.obs;
  RxBool isRegistry = false.obs;
  RxBool isInsurance = false.obs;
  RxBool isSafety = false.obs;
  RxBool isUpgrade = false.obs;
  RxBool isSubscription = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSettings();
  }

  Future<void> getSettings() async {
    final response = await getSettingsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        isNotification.value = data.data?.pushNotifications ?? false;
        isAutoPayment.value = data.data?.autoPayRent ?? false;
      },
    );
  }
}
