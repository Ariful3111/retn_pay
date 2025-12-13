import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/core/utils/time_picker.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_time_field.dart';

class InspectionFromField extends StatelessWidget {
  const InspectionFromField({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyViewController propertyViewController = Get.find();
    return Column(
      children: [
        CustomTextField(
          controller: propertyViewController.nameController,
          labelText: 'Full Name*',
          hintText: 'Enter Your Full Name',
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomTextField(
          controller: propertyViewController.emailController,
          labelText: 'Email Address*',
          hintText: 'Enter Your Email Address',
          validator: propertyViewController.emailValidation,
          validation: AutovalidateMode.onUserInteraction,
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomTextField(
          controller: propertyViewController.phoneController,
          labelText: 'Phone Number*',
          hintText: 'Enter Your Phone Number',
          validator: propertyViewController.phoneValidation,
          validation: AutovalidateMode.onUserInteraction,
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 15.66.h),
        CustomDateField(
          controller: propertyViewController.dateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                propertyViewController.selectedDate.value = date;
                propertyViewController.dateController.text =
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
          controller: propertyViewController.timeController,
          onTap: () {
            TimePicker.pickTime(
              context: context,
              onTimeSelected: (time) {
                propertyViewController.selectedTime.value = time;
                propertyViewController.timeController.text = time.format(
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
            propertyViewController.selectedInspection.value = value!;
            propertyViewController.isSelectedInspection.value = true;
          },
          option: propertyViewController.inspectOption,
          isSelect: propertyViewController.selectedInspection,
          labelText: 'Inspection Type',
        ),
      ],
    );
  }
}
