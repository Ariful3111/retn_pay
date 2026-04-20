import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/settings_model.dart';
import 'package:renter_pay/features/auth/repositories/get_settings_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class GetSettingsController extends GetxController {
  final AppSettingsRepository settingsRepository;
  GetSettingsController({required this.settingsRepository});

  final settings = Rxn<GetSettingsModel>();
  RxBool isLoading = true.obs;

  Future<void> getSettings() async {
    final response = await settingsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        settings.value = data;
        debugPrint("Settings Loaded");
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getSettings();
  }
}
