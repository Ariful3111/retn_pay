import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/landlord_repair_maintenance/landlord_repair_maintenance_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordRepairMaintenanceTable
    extends GetWidget<LandlordRepairMaintenanceController> {
  const LandlordRepairMaintenanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final list = controller.repairs;
      final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
        final item = list[index];
        return [
          CustomTextPrimary(
            text: item.title ?? '',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
          ),
          TableStatus(status: item.status?.capitalizeFirst ?? ''),
          LandlordRepairMaintenanceTableData(
            maintenanceRequestId: item.id,
          ),
        ];
      });

      return controller.isLoading.value
          ? ButtonLoading()
          : Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CustomTable(
                column: controller.repairColumn,
                row: rowWidgets,
                onRowTap: controller.showExpandedData,
                isExpandedTableBuilder: (index) {
                  return index < controller.expandedData.length &&
                      controller.expandedData[index];
                },
                expandedTableBuilder: (index) {
                  if (index >= list.length) {
                    return SizedBox.shrink();
                  }
                  final item = list[index];
                  final isOpen = index < controller.expandedData.length
                      ? controller.expandedData[index]
                      : false;
                  return CustomTableExpanded(
                    title: userIndex == 2
                        ? 'Tenant Name: ${item.tenant?.name ?? ''}'
                        : 'Issue Title: ${item.title ?? ''}',
                    isOpen: isOpen,
                    onExpandedClose: () {
                      controller.showExpandedData(index);
                    },
                    expandedContent: LandlordRepairMaintenanceTableContent(
                      index: index,
                    ),
                  );
                },
                isNeedLastCol: true,
              ),
            );
    });
  }
}
