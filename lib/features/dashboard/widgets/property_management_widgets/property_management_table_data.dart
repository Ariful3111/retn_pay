import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementTableData extends StatelessWidget {
  final int index;
  const PropertyManagementTableData({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();

    // Safety check: ensure listData has data at this index
    final listData = propertyManagementController.listData;
    if (index < 0 || index >= listData.length) {
      return const Center(child: CustomTextSecondary(text: '-'));
    }

    final rowIndex = listData[index].key;
    final allRows = propertyManagementController.allRows;

    // Safety check: ensure allRows has data at rowIndex
    if (rowIndex < 0 || rowIndex >= allRows.length) {
      return const Center(child: CustomTextSecondary(text: '-'));
    }

    final item = allRows[rowIndex];

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
