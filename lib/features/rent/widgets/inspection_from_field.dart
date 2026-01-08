import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/core/utils/time_picker.dart';
import 'package:renter_pay/features/rent/controllers/inspection_from_controller.dart';
import 'package:renter_pay/shared/extensions/Validators/email_validator.dart';
import 'package:renter_pay/shared/extensions/Validators/phone_validator.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_time_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionFromField extends StatelessWidget {
  const InspectionFromField({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    InspectionFromController inspectionFromController = Get.find();
    return Column(
      children: [
        CustomTextField(
          fillColor:isDark? AppColors.darkPrimary:AppColors.whiteColor,
          controller: inspectionFromController.nameController,
          labelText: 'Full Name*',
          hintText: 'Enter Your Full Name',
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomTextField(
          fillColor: isDark? AppColors.darkPrimary:AppColors.whiteColor,
          controller: inspectionFromController.emailController,
          labelText: 'Email Address*',
          hintText: 'Enter Your Email Address',
          validator: emailValidation,
          validation: AutovalidateMode.onUserInteraction,
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomTextField(
          fillColor: isDark? AppColors.darkPrimary:AppColors.whiteColor,
          controller: inspectionFromController.phoneController,
          labelText: 'Phone Number*',
          hintText: 'Enter Your Phone Number',
          validator: phoneValidation,
          validation: AutovalidateMode.onUserInteraction,
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomDateField(
          fillColor: isDark? AppColors.darkPrimary:AppColors.whiteColor,
          controller: inspectionFromController.dateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                inspectionFromController.selectedDate.value = date;
                inspectionFromController.dateController.text =
                    "${date.day.toString().padLeft(2, '0')}/"
                    "${date.month.toString().padLeft(2, '0')}/"
                    "${date.year}";
              },
            );
          },
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomTimeField(
          fillColor: isDark? AppColors.darkPrimary:AppColors.whiteColor,
          controller: inspectionFromController.timeController,
          onTap: () {
            TimePicker.pickTime(
              context: context,
              onTimeSelected: (time) {
                inspectionFromController.selectedTime.value = time;
                inspectionFromController.timeController.text = time.format(
                  context,
                );
              },
            );
          },
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomDropdownMenu(
          onSelect: (value) {
            inspectionFromController.selectedInspection.value = value!;
            inspectionFromController.isSelectedInspection.value = true;
          },
          option: inspectionFromController.inspectOption,
          isSelect: inspectionFromController.selectedInspection,
          label: CustomTextSecondary(
            text: 'Inspection Type*',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
