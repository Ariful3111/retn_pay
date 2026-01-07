import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordRepairMaintenanceTable extends StatelessWidget {
  const LandlordRepairMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    LandlordRepairMaintenanceController landlordRepairMaintenanceController = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Obx(() {
        final rowList = landlordRepairMaintenanceController.tableData;
        final rowWidgets = List<List<Widget>>.generate(rowList.length, (
          index,
        ) {
          final item = rowList[index].value;
          final listIndex = rowList.map((e) => e.key).toList();
          return [
            CustomTextPrimary(
              text: item.issueName,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            LandlordRepairMaintenanceTableData(index: listIndex[index]),
            
          ];
        });
        final listIndex = rowList.map((e) => e.key).toList();
        return CustomTable(
          column: landlordRepairMaintenanceController.repairColumn,
          row: rowWidgets,
          onRowTap: (index) {
            landlordRepairMaintenanceController.showExpandedData(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return landlordRepairMaintenanceController.expandedData[listIndex[index]];
          },
          expandedTableBuilder: (index) {
            final item = rowList[index].value;
            return CustomTableExpanded(
              title: 'Issue Title: ${item.issueName}',
              isOpen:
                  landlordRepairMaintenanceController.expandedData[listIndex[index]],
              onExpandedClose: () {
                landlordRepairMaintenanceController.showExpandedData(
                  listIndex[index],
                );
              },
              expandedContent: LandlordRepairMaintenanceTableContent(
                index: listIndex[index],
              ),
            );
          }, isNeedLastCol: true,
        );
      }),
    );
  }
}