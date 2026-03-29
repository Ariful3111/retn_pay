import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ApplicationManagementDetailsPartCFields extends GetWidget<ApplicationManagementDetailsTableController> {
  final DisclosureItem item;
  final int itemIndex;

  const ApplicationManagementDetailsPartCFields({super.key, 
    required this.item,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {

    final fields = [
      'Trading name of the embedded network operator',
      'ABN of the embedded network operator',
      'Phone number of the embedded network operator',
      'Website address of the embedded network operator',
      'Electricity tariffs and all other fees and charges applicable (or where that information may be accessed)',
    ];

    return Column(
      children: fields.map((label) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: CustomTextField(
            controller: controller.getAdditionalFieldController(
              itemIndex,
              label,
            ),
            hintText: 'Enter information',
            labelText: label,
          ),
        );
      }).toList(),
    );
  }
}
