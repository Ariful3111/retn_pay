import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_details_widgets/application_management_details_part_e_widgets/application_management_details_part_e_helper.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ApplicationManagementDetailsPartEEmployment
    extends GetWidget<ApplicationManagementDetailsPartEController> {
  const ApplicationManagementDetailsPartEEmployment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final readOnly = !controller.isEditable.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationManagementDetailsPartEHelper.sectionTitle(
            '5. Employment details',
            isDark,
          ),
          SizedBox(height: 16.h),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.occupationController,
            'Occupation',
            isDark,
            readOnly: readOnly,
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text: 'Type',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double itemWidth = (constraints.maxWidth - 20.w) / 2;
                    return Wrap(
                      spacing: 20.w,
                      runSpacing: 12.h,
                      children: List.generate(
                        controller.employmentTypeOptions.length,
                        (index) {
                          return SizedBox(
                            width: itemWidth,
                            child: Obx(
                              () => CustomRadioButton(
                                value: index,
                                groupValue: controller.employmentType.value,
                                onChange: (value) {
                                  if (!readOnly) {
                                    controller.employmentType.value = value!;
                                  }
                                },
                                text: controller.employmentTypeOptions[index],
                                fontSize: 16.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.salaryController,
            'Salary income per week (\$)',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
          ),
          ApplicationManagementDetailsPartEHelper.textField(
            controller.otherIncomeController,
            'Other net income per week (\$)',
            isDark,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
          ),
        ],
      );
    });
  }
}
