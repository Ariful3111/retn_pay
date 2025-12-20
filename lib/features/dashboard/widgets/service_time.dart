import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service_time_period.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceTime extends StatelessWidget {
  const ServiceTime({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceSearchController serviceSearchController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text: 'Preferred Time of Service',
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 4.h),
        CustomTextSecondary(
          text:
              'Please provide the dates and times you are available for us to respond.',
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 20.h),
        Container(
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(text: 'Availability 1'),
              SizedBox(height: 12.h),
              CustomDateField(
                fillColor: isDark
                    ? AppColors.darkPrimary
                    : AppColors.whiteColor,
                controller: serviceSearchController.dateController,
                onTap: () {
                  DatePicker.pickDate(
                    context: context,
                    onDateSelected: (date) {
                      serviceSearchController.selectedDate.value = date;
                      serviceSearchController.dateController.text =
                          "${date.day.toString().padLeft(2, '0')}/"
                          "${date.month.toString().padLeft(2, '0')}/"
                          "${date.year}";
                    },
                  );
                },
              ),
              SizedBox(height: 16.h),
              ServiceTimePeriod(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        CustomSecondaryButton(
          width: 125.w,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            children: [
              Icon(Icons.add, color: AppColors.borderColor, size: 14.sp),
              SizedBox(width: 4.w),
              CustomTextSecondary(
                text: 'Add New',
                color: AppColors.borderColor,
              ),
            ],
          ),
          onPressed: () {},
        ),
        SizedBox(height: 28.h,),
        Center(
          child: CustomPrimaryButton(
            height: 40.h,
            width: 152.w,
            borderRadius: BorderRadius.circular(6.r),
            text: 'Submit Request',
            onPressed: () {
            
          },),
        )
      ],
    );
  }
}
