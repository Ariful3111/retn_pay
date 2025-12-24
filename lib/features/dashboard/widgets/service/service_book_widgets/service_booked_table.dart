import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_booked_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table_action.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceBookedTable extends StatelessWidget {
  const ServiceBookedTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceBookedController serviceBookedController = Get.find();
    return MediaQuery(
      data: MediaQueryData(
        size: Size(MediaQuery.widthOf(context), MediaQuery.heightOf(context)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: Obx(() {
          final list = serviceBookedController.filterRow;
          final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
            final item = list[index].value;
            return [
              CustomTextPrimary(
                text: item.serviceName,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textOverflow: TextOverflow.ellipsis,
              ),
              TableStatus(status: item.status),
              ServiceBookedTableAction(),
            ];
          });
          final listIndex = list.map((e) => e.key).toList();
          return CustomTable(
            column: serviceBookedController.tableColumn,
            row: rowWidgets,
            listIndex: listIndex,
            expandedTableBuilder: (index) {
              final item = list[index].value;
              final rowIndex = listIndex[index];
              return CustomTableExpanded(
                title: 'Property Address: ${item.serviceName}',
                isOpen: serviceBookedController.expandedData[rowIndex],
                onExpandedClose: () {
                  serviceBookedController.showExpandedData(rowIndex);
                },
                expandedContent: ServiceBookedTableContent(rowIndex: rowIndex),
              );
            },
            onRowTap: (index) {
              serviceBookedController.showExpandedData(listIndex[index]);
            },
            isExpandedTableBuilder: (index) {
              return serviceBookedController.expandedData[listIndex[index]];
            }, isNeedLastCol: true,
          );
        }),
      ),
    );
  }
}
