import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table_data.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementTable extends StatelessWidget {
  const ApplicationManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ApplicationManagementController applicationManagementController =
        Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = applicationManagementController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.property,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            ApplicationManagementTableStatus(status: item.status,),
            ApplicationManagementTableData(index: index),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: applicationManagementController.tableColumn,
          row: rowWidgets,
          expandedTableBuilder: (index) {
            final item = list[index].value;
            final rowIndex = listIndex[index];
            return CustomTableExpanded(
              title: 'Property Address: ${item.property}',
              isOpen: applicationManagementController.expanded[rowIndex],
              onExpandedClose: () {
                applicationManagementController.toggleExpanded(rowIndex);
              },
              expandedContent: ApplicationManagementTableContent(index: listIndex[index]),
            );
          },
          onRowTap: (index) {
            applicationManagementController.toggleExpanded(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return applicationManagementController.expanded[listIndex[index]];
          },
          isNeedLastCol: true,
        );
      }),
    );
  }
}
