import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTable extends GetWidget<InspectionRequestController> {
  const InspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final rowWidgets = List<List<Widget>>.generate(
          controller.inspections.value!.data!.length,
          (index) {
            final item = controller.inspections.value!.data![index];
            return [
              CustomTextPrimary(
                text: item.property?.address ?? '',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textOverflow: TextOverflow.ellipsis,
              ),
              TableStatus(status: item.status?.capitalizeFirst ?? ''),
              InspectionTableData(id: item.id ?? 0),
            ];
          },
        );

        return CustomTable(
          column: controller.tableColumn,
          row: rowWidgets,
          expandedTableBuilder: (index) {
            final item = controller.inspections.value!.data![index];
            return CustomTableExpanded(
              title: 'Property Address: ${item.property?.address ?? ''}',
              isOpen: controller.expanded.contains(item.id ?? 0),
              onExpandedClose: () {
                controller.expanded.remove(item.id ?? 0);
              },
              expandedContent: InspectionTableContent(id: item.id ?? 0),
            );
          },
          onRowTap: (index) {
            final item = controller.inspections.value!.data![index];
            controller.toggleExpanded(id: item.id ?? 0);
          },
          isExpandedTableBuilder: (index) {
            final item = controller.inspections.value!.data![index];
            return controller.expanded.contains(item.id ?? 0);
          },
          isNeedLastCol: true,
        );
      }),
    );
  }
}
