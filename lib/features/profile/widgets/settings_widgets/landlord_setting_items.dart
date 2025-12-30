import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/settings_controller.dart';
import 'package:renter_pay/features/profile/widgets/settings_widgets/settings_item_model.dart';

class LandlordSettingItems extends StatelessWidget {
  const LandlordSettingItems({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find();
    return IgnorePointer(
      ignoring: !settingsController.isUpgrade.value,
      child: Opacity(
        opacity: settingsController.isUpgrade.value ? 1 : 0.4,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsItemModel(
                title: 'Land Data Registry Expiry',
                subTitle:
                    'Get timely reminders before your land registry expires so you never miss important updates.',
                isOn: settingsController.isRegistry.value,
                onChanged: (value) {
                  settingsController.isRegistry.value = value;
                },
              ), 
              SizedBox(height: 32.h),
              SettingsItemModel(
                title: 'Landlord Insurance Expiry',
                subTitle:
                    'Receive alerts before your insurance ends, keeping your property secure and covered at all times.',
                isOn: settingsController.isInsurance.value,
                onChanged: (value) {
                  settingsController.isInsurance.value = value;
                },
              ),
              SizedBox(height: 32.h),
              SettingsItemModel(
                title: 'Fire Alarm Safety Service Expiry',
                subTitle:
                    'Be notified ahead of time when your fire alarm service is due, ensuring safety without interruption.',
                isOn: settingsController.isSafety.value,
                onChanged: (value) {
                  settingsController.isSafety.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
