import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/core/utils/time_picker.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';
import 'package:renter_pay/features/rent/widgets/inspection_field.dart';
import 'package:renter_pay/features/rent/widgets/inspection_type.dart';

class InspectionFromField extends StatelessWidget {
  const InspectionFromField({super.key});

  @override
  Widget build(BuildContext context) {
    RentDetailsController rentDetailsController = Get.find();
    return Column(
      children: [
        InspectionField(
          controller: rentDetailsController.nameController,
          label: 'Full Name*',
          hint: 'Enter Your Full Name',
        ),
        SizedBox(height: 15.66.h),
        InspectionField(
          controller: rentDetailsController.emailController,
          label: 'Email Address*',
          hint: 'Enter Your Email Address',
          validator: rentDetailsController.emailValidation,
          validateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(height: 15.66.h),
        InspectionField(
          controller: rentDetailsController.phoneController,
          label: 'Phone Number*',
          hint: 'Enter Your Phone Number',
          validator: rentDetailsController.phoneValidation,
          validateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(height: 15.66.h),
        InspectionField(
          controller: rentDetailsController.dateController,
          label: 'Date*',
          hint: 'Select Date',
          readOnly: true,
          suffix: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () {
                DatePicker.pickDate(
                  context: context,
                  onDateSelected: (date) {
                    rentDetailsController.selectedDate.value = date;
                    rentDetailsController.dateController.text =
                        "${date.day.toString().padLeft(2, '0')}/"
                        "${date.month.toString().padLeft(2, '0')}/"
                        "${date.year}";
                  },
                );
              },
              child: Image.asset(
                IconsPath.date,
                height: 15.66.h,
                width: 15.66.w,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.66.h),
        InspectionField(
          controller: rentDetailsController.timeController,
          label: 'Time*',
          hint: 'Select Time',
          readOnly: true,
          suffix: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () {
                TimePicker.pickTime(context: context, onTimeSelected: (time) {
                  rentDetailsController.selectedTime.value = time;
                  rentDetailsController.timeController.text = time.format(context);
                },);
              },
              child: Image.asset(
                IconsPath.time,
                height: 15.66.h,
                width: 15.66.w,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.66.h),
        InspectionType(),
      ],
    );
  }
}
