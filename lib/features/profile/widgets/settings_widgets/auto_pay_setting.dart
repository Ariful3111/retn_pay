import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/controllers/update_settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/settings_item_model.dart';

class AutoPaySetting extends StatelessWidget {
  const AutoPaySetting({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find();
    return Obx(
      () => SettingsItemModel(
        title: "Auto-Pay Rent",
        subTitle:
            'Set up automatic payments and never miss a rent due date again.',
        isOn: settingsController.isAutoPayment.value,
        onChanged: (value) async {
          settingsController.isAutoPayment.value = value;
          await Get.find<UpdateSettingsController>().updateSettings();
        },
      ),
    );
  }
}
