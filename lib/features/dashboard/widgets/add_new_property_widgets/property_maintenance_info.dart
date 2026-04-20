import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/utils/date_picker.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_date_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyMaintenanceInfo extends StatelessWidget {
  const PropertyMaintenanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPropertyController addNewPropertyController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Property Maintenance Information:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 20.h),
          CustomDateField(
            label: 'Last Fire Alarm Service Date',
            fillColor: isDark ? null : AppColors.whiteColor,
            controller: addNewPropertyController.dateController,
            onTap: () {
              DatePicker.pickDate(
                lastDate: DateTime.now(),
                context: context,
                onDateSelected: (date) {
                  addNewPropertyController.selectedDate.value = date;
                  addNewPropertyController.dateController.text =
                      "${date.day.toString().padLeft(2, '0')}/"
                      "${date.month.toString().padLeft(2, '0')}/"
                      "${date.year}";
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
