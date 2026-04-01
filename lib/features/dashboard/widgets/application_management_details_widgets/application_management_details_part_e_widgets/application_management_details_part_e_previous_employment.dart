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
    final helper = ApplicationManagementDetailsPartEHelper();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        helper.sectionTitle('7. Previous employment', isDark),
        SizedBox(height: 16.h),
        helper.textField(
          controller.previousEmployerNameController,
          'Name of previous employer',
          isDark,
        ),
        helper.textField(
          controller.previousEmployerAddressController,
          'Address of previous employer',
          isDark,
        ),
        helper.textField(
          controller.previousEmployerPostcodeController,
          'Postcode',
          isDark,
        ),
        helper.sectionTitle('How long employed there', isDark,size: 14.sp),
        SizedBox(height: 12.h),

        helper.textField(
          controller.previousYearsController,
          'Years',
          isDark,
        ),

        helper.textField(
          controller.previousMonthsController,
          'Months',
          isDark,
        ),

        helper.textField(
          controller.previousPositionController,
          'Position held',
          isDark,
        ),
        helper.textField(
          controller.previousContactPersonController,
          'Name of contact person',
          isDark,
        ),
        helper.textField(
          controller.previousPhoneController,
          'Phone number',
          isDark,
        ),
        helper.textField(
          controller.previousRemarksController,
          'Remarks',
          isDark,
          maxLines: 4,
          isAlignLabelWithHint: true,
        ),
      ],
    );
  }
}
