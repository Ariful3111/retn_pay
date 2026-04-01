import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';

class ApplicationManagementDetailsPartEApplication
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartEApplication({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApplicationManagementDetailsPartEHelper().sectionTitle(
          '3. Applicant details',
          isDark,
        ),
        SizedBox(height: 16.h),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.applicantNameController,
          'Name of applicant',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.applicantAddressController,
          'Address',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.applicantPostcodeController,
          'Postcode',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().sectionTitle(
          'Contact phone numbers',
          isDark,
          size: 14,
        ),
        SizedBox(height: 16.h),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.businessHourController,
          'Business hours',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.afterHourController,
          'After hours',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.applicationEmailController,
          'Email address',
          isDark,
        ),
        CustomDateField(
          controller: controller.dobController,
          label: 'Date of birth',
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          textColor: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                controller.dobController.text =
                    "${date.day}/${date.month}/${date.year}";
              },
            );
          },
        ),
        SizedBox(height: 20.h),
        ApplicationManagementDetailsPartEHelper().sectionTitle(
          'Dependents who will live in the premises',
          isDark,
          size: 14,
        ),
        SizedBox(height: 16.h),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.dependentsNumberController,
          'Number',
          isDark,
        ),
        ApplicationManagementDetailsPartEHelper().textField(
          controller.dependentsAgeController,
          'Age of each',
          isDark,
        ),
      ],
    );
  }
}
