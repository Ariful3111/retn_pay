import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_action.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyManagementTable extends StatelessWidget {
  const PropertyManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    PropertyManagementController propertyManagementController = Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = propertyManagementController.listData;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.address,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            PropertyManagementTableData(index: index),
            item.verifyStatus == 'Approved'
                ? PropertyManagementTableAction(index: index,)
                : SizedBox.shrink(),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: propertyManagementController.tableColumn,
          row: rowWidgets,
          listIndex: listIndex,
          expandedTableBuilder: (index) {
            final item = list[index].value;
            final rowIndex = listIndex[index];
            return CustomTableExpanded(
              title: 'Property Address: ${item.address}',
              isOpen: propertyManagementController.expanded[rowIndex],
              onExpandedClose: () {
                propertyManagementController.toggleExpanded(rowIndex);
              },
              expandedContent: PropertyManagementTableContent(
                rowIndex: rowIndex,
              ),
            );
          },
          onRowTap: (index) {
            propertyManagementController.toggleExpanded(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return propertyManagementController.expanded[listIndex[index]];
          },
          isNeedLastCol: true,
        );
      }),
    );
  }
}
