import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:signature/signature.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'dart:convert';

class ApplicationManagementDetailsPetsDeclaration
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPetsDeclaration({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            '9. Pets',
            isDark,
          ),
          SizedBox(height: 16.h),
          Row(
            children: List.generate(controller.petOptions.length, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 40.w),
                child: CustomRadioButton(
                  value: index,
                  groupValue: controller.petType.value,
                  onChange: (value) {
                    if (!readOnly) {
                      controller.petType.value = value!;
                    }
                  },
                  text: controller.petOptions[index],
                  fontSize: 16.sp,
                ),
              );
            }),
          ),
          SizedBox(height: 16.h),
          CustomTextSecondary(
            text: 'If Yes, number and type of pets',
            fontSize: 16.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 8.h),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.petDetailsController,
            'Enter number of pets',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
          ),
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            '10.Applicant\'s declaration',
            isDark,
          ),
          SizedBox(height: 12.h),
          CustomTextSecondary(
            text:
                'I declare that the information given on this form is true and correct to the best of my knowledge.',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFDFE2E6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: CustomTextSecondary(
                    text: 'Applicant\'s signature',
                    fontSize: 12.sp,
                  ),
                ),
                Expanded(
                  child: readOnly && controller.hasSignature
                      ? _buildSignatureImage()
                      : readOnly
                      ? Center(
                          child: CustomTextSecondary(
                            text: 'No signature available',
                            fontSize: 14.sp,
                            color: AppColors.secondaryTextColor,
                          ),
                        )
                      : Signature(
                          controller: controller.signatureController,
                          backgroundColor: Colors.transparent,
                        ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CustomDateField(
            controller: controller.dateController,
            onTap: () {
              if (!readOnly) {
                DatePicker.pickDate(
                  context: context,
                  onDateSelected: (date) {
                    controller.dateController.text =
                        "${date.day}/${date.month}/${date.year}";
                  },
                );
              }
            },
            label: 'Date',
            fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          ),
        ],
      );
    });
  }

  Widget _buildSignatureImage() {
    final signatureData = controller.existingSignature.value;
    if (signatureData.isEmpty) {
      return const SizedBox.shrink();
    }

    // Check if it's a base64 data URL
    if (signatureData.startsWith('data:image')) {
      // Extract base64 part from data URL
      final base64String = signatureData.split(',').last;
      try {
        final bytes = base64Decode(base64String);
        return Image.memory(bytes, fit: BoxFit.contain);
      } catch (e) {
        return const SizedBox.shrink();
      }
    } else {
      // Regular URL
      return Image.network(
        signatureData,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      );
    }
  }
}
