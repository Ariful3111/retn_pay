import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/profile/controllers/update_settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/settings_item_model.dart';

class DarkModeSetting extends StatelessWidget {
  const DarkModeSetting({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return SettingsItemModel(
      title: "Dark Mode",
      subTitle:
          'Enjoy a sleek, eye-friendly interface with our easy-to-switch dark mode.',
      isOn: themeController.isDarkMode.value,
      onChanged: (value) async {
        themeController.changeTheme(value);
        await Get.find<UpdateSettingsController>().updateSettings();
      },
    );
  }
}
