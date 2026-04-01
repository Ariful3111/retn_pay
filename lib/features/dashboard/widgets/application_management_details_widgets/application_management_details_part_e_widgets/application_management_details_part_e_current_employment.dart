import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';

class ApplicationManagementDetailsPartECurrentEmployment
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartECurrentEmployment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final helper = ApplicationManagementDetailsPartEHelper();

    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          helper.sectionTitle('6. Current employment', isDark),
          SizedBox(height: 16.h),
          helper.textField(
            controller.currentEmployerNameController,
            'Name of current employer',
            isDark,
            readOnly: readOnly,
          ),
          helper.textField(
            controller.currentEmployerAddressController,
            'Address of current employer',
            isDark,
            readOnly: readOnly,
          ),
          helper.textField(
            controller.currentEmployerPostcodeController,
            'Postcode',
            isDark,
            readOnly: readOnly,
          ),
          SizedBox(height: 8.h),
          helper.sectionTitle('How long employed there', isDark, size: 14),
          SizedBox(height: 12.h),
          helper.textField(
            controller.yearsController,
            'Years',
            isDark,
            readOnly: readOnly,
          ),
          helper.textField(
            controller.monthsController,
            'Months',
            isDark,
            readOnly: readOnly,
          ),
          SizedBox(height: 4.h),
          helper.textField(
            controller.positionController,
            'Position held',
            isDark,
            readOnly: readOnly,
          ),
          helper.textField(
            controller.contactPersonController,
            'Name of contact person',
            isDark,
            readOnly: readOnly,
          ),
          helper.textField(
            controller.phoneController,
            'Phone number',
            isDark,
            readOnly: readOnly,
          ),

          helper.textField(
            controller.remarksController,
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
