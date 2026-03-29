import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_d_field.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_d_paid.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementDetailsPartD extends StatelessWidget {
  const ApplicationManagementDetailsPartD({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ApplicationManagementDetailsController>();
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(title: 'Rental property details', isDark: isDark),
        SizedBox(height: 16.h),
        ApplicationManagementDetailsPartDField(label: 'Address'),
        ApplicationManagementDetailsPartDField(label: 'Postcode'),
        ApplicationManagementDetailsPartDField(label: 'Rent amount (\$)'),
        SizedBox(height: 12.h),
        ApplicationManagementDetailsPartDPaid(),
        SizedBox(height: 12.h),
        ApplicationManagementDetailsPartDField(
          label: 'Property bond amount (\$)',
        ),
        SizedBox(height: 12.h),
        CustomDateField(
          fillColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          label: 'Tenancy start date',
          controller: controller.startDateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                controller.startDateController.text =
                    "${date.day.toString().padLeft(2, '0')}/"
                    "${date.month.toString().padLeft(2, '0')}/"
                    "${date.year}";
              },
            );
          },
        ),
        SizedBox(height: 12.h),
        CustomDateField(
          fillColor: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          label: 'Tenancy end date (if any)',
          controller: controller.endDateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                controller.endDateController.text =
                    "${date.day.toString().padLeft(2, '0')}/"
                    "${date.month.toString().padLeft(2, '0')}/"
                    "${date.year}";
              },
            );
          },
        ),
        SizedBox(height: 24.h),
        title(title: 'Property manager details', isDark: isDark),
        SizedBox(height: 16.h),
        ApplicationManagementDetailsPartDField(
          label: 'Name of property manager',
        ),
        ApplicationManagementDetailsPartDField(label: 'Phone number'),
        ApplicationManagementDetailsPartDField(label: 'Email address'),
        ApplicationManagementDetailsPartDField(
          label: 'Name of estate agency (if applicable)',
        ),
      ],
    );
  }

  Widget title({required String title, required bool isDark}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.whiteColor : AppColors.primaryColorDark,
    );
  }
}
