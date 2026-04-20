import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';

class ApplicationManagementDetailsPartEPreviousEmployment
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartEPreviousEmployment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            '7. Previous employment',
            isDark,
          ),
          SizedBox(height: 16.h),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousEmployerNameController,
            'Name of previous employer',
            isDark,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousEmployerAddressController,
            'Address of previous employer',
            isDark,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousEmployerPostcodeController,
            'Postcode',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
          ),
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            'How long employed there',
            isDark,
            size: 14.sp,
          ),
          SizedBox(height: 12.h),

          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousYearsController,
            'Years',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
          ),

          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousMonthsController,
            'Months',
            isDark,
            readOnly: readOnly,
          ),

          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousPositionController,
            'Position held',
            isDark,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousContactPersonController,
            'Name of contact person',
            isDark,
            readOnly: readOnly,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousPhoneController,
            'Phone number',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.phone,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.previousRemarksController,
            'Remarks',
            isDark,
            maxLines: 4,
            isAlignLabelWithHint: true,
            readOnly: readOnly,
          ),
        ],
      );
    });
  }
}
