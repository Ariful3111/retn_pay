import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/settings_item_model.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find();
    return Obx(
      () => SettingsItemModel(
        title: 'Notifications',
        subTitle:
            'Stay updated with instant alerts and important reminders right on your device.',
        isOn: settingsController.isNotification.value,
        onChanged: (value) {
          settingsController.isNotification.value = value;
        },
      ),
    );
  }
}
