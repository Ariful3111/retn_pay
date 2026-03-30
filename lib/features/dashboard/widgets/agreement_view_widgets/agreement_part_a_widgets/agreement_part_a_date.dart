import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/agreement_view_widgets/agreement_helper.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AgreementPartADate extends GetWidget<AgreementPartAController> {
  const AgreementPartADate({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDateField(
          controller: controller.dateOfAgreementController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                controller.dateOfAgreementController.text =
                    "${date.day}/${date.month}/${date.year}";
              },
            );
          },
          label: 'This is the date the agreement is signed.',
          textColor: isDark
              ? AppColors.darkSecondaryText
              : AppColors.darkTextColor,
          fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        ),
        SizedBox(height: 12.h),
        CustomTextSecondary(
          text:
              'If the agreement is signed by the parties on different days, the date of the agreement is the date the last person signs the agreement.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 12.h),
        AgreementHelper().divider(isDark: isDark),
        
      ],
    );
  }
}
