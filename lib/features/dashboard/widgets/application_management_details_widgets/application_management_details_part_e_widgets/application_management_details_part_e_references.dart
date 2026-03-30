import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartEReferences
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartEReferences({super.key});

  @override
  Widget build(BuildContext context) {
    final helper = ApplicationManagementDetailsPartEHelper();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        helper.sectionTitle('8. References', isDark),
        SizedBox(height: 4.h),
        CustomTextSecondary(
          text: '(If you have written references attach copies to this form)',
          fontSize: 12.sp,
          fontStyle: FontStyle.italic,
          color: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 16.h),
        CustomTextSecondary(
          text: 'Referee 1',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),

        helper.textField(controller.ref1NameController, 'Name', isDark),
        helper.textField(
          controller.ref1RelationController,
          'Relationship to applicant',
          isDark,
        ),
        helper.textField(
          controller.ref1HomePhoneController,
          'Home phone number',
          isDark,
        ),
        helper.textField(
          controller.ref1WorkPhoneController,
          'Work phone number',
          isDark,
        ),
        CustomTextSecondary(
          text: 'Referee 2',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        helper.textField(controller.ref2NameController, 'Name', isDark),
        helper.textField(
          controller.ref2RelationController,
          'Relationship to applicant',
          isDark,
        ),
        helper.textField(
          controller.ref2HomePhoneController,
          'Home phone number',
          isDark,
        ),
        helper.textField(
          controller.ref2WorkPhoneController,
          'Work phone number',
          isDark,
        ),
      ],
    );
  }
}
