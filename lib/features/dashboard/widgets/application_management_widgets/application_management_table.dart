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
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ApplicationManagementTable
    extends GetWidget<ApplicationManagementController> {
  const ApplicationManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final list = controller.items;
      if (controller.isLoading.value) {
        return ButtonLoading();
      }

      final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
        final item = list[index];
        final status = item.status ?? '';
        final id = item.id ?? 0;
        return [
          CustomTextPrimary(
            text: item.property?.address ?? '',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textOverflow: TextOverflow.ellipsis,
          ),
          ApplicationManagementTableStatus(status: status),
          ApplicationManagementTableData(index: id),
        ];
      });

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: CustomTable(
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
              expandedContent: ApplicationManagementTableContent(index: id),
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
        ),
      );
    });
  }
}
