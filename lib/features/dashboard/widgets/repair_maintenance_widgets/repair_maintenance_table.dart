import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_maintenance_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_maintenance_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairMaintenanceTable extends StatelessWidget {
  const RepairMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RepairMaintenanceController repairMaintenanceController = Get.find();
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Obx(() {
          final rowList = repairMaintenanceController.tableData;
          final rowWidgets = List<List<Widget>>.generate(rowList.length, (
            index,
          ) {
            final item = rowList[index].value;
            final listIndex = rowList.map((e) => e.key).toList();
            return [
              CustomTextPrimary(
                text: item.title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textOverflow: TextOverflow.ellipsis,
              ),
              RepairMaintenanceTableStatus(rowIndex: listIndex[index]),
              CustomPrimaryButton(
                text: 'View',
                height: 37.h,
                width: 63.w,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textColor: AppColors.darkAppBar,
                borderRadius: BorderRadius.circular(6.r),
                onPressed: () {
                  repairMaintenanceController.showExpandedData(
                    listIndex[index],
                  );
                },
              ),
            ];
          });
          final listIndex = rowList.map((e) => e.key).toList();
          return CustomTable(
            column: repairMaintenanceController.repairColumn,
            row: rowWidgets,
            listIndex: listIndex,
            onRowTap: (index) {
              repairMaintenanceController.showExpandedData(listIndex[index]);
            },
            isExpandedTableBuilder: (index) {
              return repairMaintenanceController.expandedData[listIndex[index]];
            },
            expandedTableBuilder: (index) {
              final item = rowList[index].value;
              return CustomTableExpanded(
                title: 'Issue Title: ${item.title}',
                isOpen:
                    repairMaintenanceController.expandedData[listIndex[index]],
                onExpandedClose: () {
                  repairMaintenanceController.showExpandedData(
                    listIndex[index],
                  );
                },
                expandedContent: RepairMaintenanceTableContent(
                  rowIndex: listIndex[index],
                ),
              );
            }, isNeedLastCol: true,
          );
        }),
      ),
    );
  }
}
