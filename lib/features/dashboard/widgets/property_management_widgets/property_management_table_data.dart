import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementTableData extends StatelessWidget {
  final int index;
  const PropertyManagementTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
     final rowIndex = propertyManagementController.listData[index].key;
    final item = propertyManagementController.allRows[rowIndex];

    if (item.verifyStatus != 'Approved') {
      return const Center(child: CustomTextSecondary(text: '-'));
    }
    return Center(
      child: item.enlistStatus == 'Publish'
          ? const TableStatus(status: 'Publish')
          : const CustomTextSecondary(text: '-'),
    );
  }
}
