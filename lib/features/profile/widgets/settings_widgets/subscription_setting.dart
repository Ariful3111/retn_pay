import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/settings_item_model.dart';

class SubscriptionSetting extends StatelessWidget {
  const SubscriptionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find();
    return Obx(
      () => SettingsItemModel(
        title: "Subscription Auto-Renewal",
        subTitle:
            'Your plan will renew automatically to ensure uninterrupted access.',
        isOn: settingsController.isSubscription.value,
        onChanged: (value) {
          settingsController.isSubscription.value = value;
        },
      ),
    );
  }
}