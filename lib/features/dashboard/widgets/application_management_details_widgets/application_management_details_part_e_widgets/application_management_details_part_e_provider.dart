import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';

class ApplicationManagementDetailsPartEProvider
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartEProvider({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            '4. Previous rental provider/agent details',
            isDark,
          ),
          SizedBox(height: 16.h),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousProviderNameController,
            'Name of previous rental provider/agent',
            isDark,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousProviderPhoneController,
            'Phone number',
            isDark,
            keyboardType: TextInputType.phone,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousProviderEmailController,
            'Email address',
            isDark,
            readOnly: readOnly,
          ),
        ],
      );
    });
  }
}
