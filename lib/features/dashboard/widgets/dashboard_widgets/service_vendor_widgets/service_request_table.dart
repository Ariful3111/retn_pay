import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/service_vendor_widgets/service_request_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceRequestTable extends StatelessWidget {
  const ServiceRequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ServiceVendorDashboardController serviceVendorDashboardController =
        Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = serviceVendorDashboardController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.name,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            TableActionButton(icon: IconsPath.actonView, onTap: () {}),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: serviceVendorDashboardController.requestTableColumn,
          row: rowWidgets,
          expandedTableBuilder: (index) {
            final item = list[index].value;
            final rowIndex = listIndex[index];
            return CustomTableExpanded(
              title: 'Client Name: ${item.clientName}',
              isOpen: serviceVendorDashboardController.expandedData[rowIndex],
              onExpandedClose: () {
                serviceVendorDashboardController.showExpandedData(rowIndex);
              },
              expandedContent: ServiceRequestTableContent(index: rowIndex),
            );
          },
          onRowTap: (index) {
            serviceVendorDashboardController.showExpandedData(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return serviceVendorDashboardController
                .expandedData[listIndex[index]];
          },
          isNeedLastCol: false,
        );
      }),
    );
  }
}
