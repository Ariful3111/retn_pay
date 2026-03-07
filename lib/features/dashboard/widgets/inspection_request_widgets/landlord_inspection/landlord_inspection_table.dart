import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_table_content.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_table_data.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordInspectionTable extends GetWidget<InspectionRequestController> {
  const LandlordInspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = controller.inspections.value?.data ?? const [];
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index];
          final id = item.id ?? 0;
          return [
            CustomTextPrimary(
              text: item.property?.address ?? '',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status?.capitalizeFirst ?? ''),
            LandlordInspectionTableData(index: id),
          ];
        });
        return CustomTable(
          column: controller.tableColumn,
          row: rowWidgets,
          expandedTableBuilder: (index) {
            final item = list[index];
            final id = item.id ?? 0;
            return CustomTableExpanded(
              title: 'Property Address: ${item.property?.address ?? ''}',
              isOpen: controller.expanded.contains(id),
              onExpandedClose: () {
                controller.expanded.remove(id);
              },
              expandedContent: LandlordInspectionTableContent(index: id),
            );
          },
          onRowTap: (index) {
            final id = list[index].id ?? 0;
            controller.toggleExpanded(id: id);
          },
          isExpandedTableBuilder: (index) {
            final id = list[index].id ?? 0;
            return controller.expanded.contains(id);
          },
          isNeedLastCol: true,
        );
      }),
    );
  }
}
