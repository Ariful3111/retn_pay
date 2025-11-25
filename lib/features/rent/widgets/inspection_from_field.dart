import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/core/utils/time_picker.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';
import 'package:renter_pay/features/rent/widgets/inspection_type.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class InspectionFromField extends StatelessWidget {
  const InspectionFromField({super.key});

  @override
  Widget build(BuildContext context) {
    RentDetailsController rentDetailsController = Get.find();
    return Column(
      children: [
        userField(
          controller: rentDetailsController.nameController,
          label: 'Full Name*',
          hint: 'Enter Your Full Name',
        ),
        SizedBox(height: 15.66.h),
        userField(
          controller: rentDetailsController.emailController,
          label: 'Email Address*',
          hint: 'Enter Your Email Address',
          validator: rentDetailsController.emailValidation,
          validateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(height: 15.66.h),
        userField(
          controller: rentDetailsController.phoneController,
          label: 'Phone Number*',
          hint: 'Enter Your Phone Number',
          validator: rentDetailsController.phoneValidation,
          validateMode: AutovalidateMode.onUserInteraction,
        ),
        SizedBox(height: 15.66.h),
        userField(
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
        userField(
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

  Widget userField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    Widget? suffix,
    AutovalidateMode? validateMode,
    bool ?readOnly,
  }) {
    return CustomTextField(
      controller: controller,
      validation: validateMode,
      validator: validator,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
      ),
      enableBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
      ),
      focusBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.4.r),
        borderSide: BorderSide(width: 0.78.r, color: Color(0xFFDFE2E6)),
      ),
      fillColor: AppColors.whiteColor,
      labelTextWidget: CustomTextSecondary(
        text: label,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      hintTextWidget: CustomTextSecondary(text: hint),
      suffixIcon: suffix,
      readOnly: readOnly,
    );
  }
}
