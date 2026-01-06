import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landrord_controller/property_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_report_data.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyManagementDetailsReport extends StatelessWidget {
  const PropertyManagementDetailsReport({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementDetailsController detailsController = Get.find();
    PropertyManagementController propertyManagementController = Get.find();

    final list = propertyManagementController.listData;
    final rowList = List<List<Widget>>.generate(list.length, (index) {
      final item = list[index].value;
      return [
        CustomTextPrimary(
          text: item.address,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
        ),
        CustomFilterAppbar(
          width: 100.w,
          height: 34.h,
          title: 'Download',
          icon: IconsPath.export,
          onTap: () {},
        ),
      ];
    });
    final listIndex = list.map((e) => e.key).toList();
    return CustomTable(
      column: detailsController.reportColumn,
      row: rowList,
      onRowTap: (index) {
        propertyManagementController.toggleExpanded(listIndex[index]);
      },
      isExpandedTableBuilder: (index) {
        return propertyManagementController.expanded[listIndex[index]];
      },
      expandedTableBuilder: (index) {
        final item = list[index].value;
        final rowIndex = listIndex[index];
        return CustomTableExpanded(
          title: 'Property Address: ${item.address}',
          isOpen: propertyManagementController.expanded[rowIndex],
          onExpandedClose: () {
            propertyManagementController.toggleExpanded(rowIndex);
          },
          expandedContent: PropertyManagementDetailsReportData(
            rowIndex: rowIndex,
          ),
        );
      },
      isNeedLastCol: false,
    );
  }
}
