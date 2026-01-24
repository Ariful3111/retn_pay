import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class LandlordRepairMaintenanceAssign extends StatelessWidget {
  const LandlordRepairMaintenanceAssign({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    LandlordRepairMaintenanceController landlordRepairMaintenanceController =
        Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: landlordRepairMaintenanceController.nameController,
          labelText: 'Name',
          fillColor: isDark ? null : AppColors.whiteColor,
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: landlordRepairMaintenanceController.numberController,
          labelText: 'Contact Number',
          fillColor: isDark ? null : AppColors.whiteColor,
        ),
      ],
    );
  }
}
