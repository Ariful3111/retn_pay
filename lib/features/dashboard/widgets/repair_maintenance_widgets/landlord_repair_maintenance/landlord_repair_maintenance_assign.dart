import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

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
        CustomTextPrimary(text: 'Assigned To', fontSize: 20.sp),
        SizedBox(height: 12.h),
        CustomTextField(controller: landlordRepairMaintenanceController.nameController,labelText: 'Name',fillColor: isDark?null:AppColors.whiteColor,),
        SizedBox(height: 16.h,),
        CustomTextField(controller: landlordRepairMaintenanceController.numberController,labelText: 'Contact Number',fillColor: isDark?null:AppColors.whiteColor,),
        SizedBox(height: 20.h,),
        CustomPrimaryButton(onPressed: () {
          
        },
        height: 40.h,
        width: 83.w,
        text: 'Assign',
        borderRadius: BorderRadius.circular(6.r),
        )
      ],
    );
  }
}
