import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTable extends StatelessWidget {
  const InspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionRequestController inspectionRequestController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = inspectionRequestController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
        final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.address,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            InspectionTableData(index: index),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: inspectionRequestController.tableColumn,
          row: rowWidgets,
          listIndex: listIndex,
          expandedTableBuilder: (index) {
            final item = list[index].value;
            final rowIndex = listIndex[index];
            return CustomTableExpanded(
              title: 'Property Address: ${item.address}',
              isOpen: inspectionRequestController.expanded[rowIndex],
              onExpandedClose: () {
                inspectionRequestController.toggleExpanded(rowIndex);
              },
              expandedContent: InspectionTableContent(rowIndex: rowIndex),
            );
          },
          onRowTap: (index) {
            inspectionRequestController.toggleExpanded(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return inspectionRequestController.expanded[listIndex[index]];
          }, isNeedLastCol: true,
        );
      }),
    );
  }
}
