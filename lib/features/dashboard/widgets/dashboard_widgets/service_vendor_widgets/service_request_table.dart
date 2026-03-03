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
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ServiceRequestTable extends GetView<ServiceVendorDashboardController> {
  const ServiceRequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: (() {
                final list = controller.requests;
                final rowWidgets = List<List<Widget>>.generate(list.length, (
                  index,
                ) {
                  final item = list[index];
                  return [
                    CustomTextPrimary(
                      text: item.service?.name ?? '',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    TableStatus(status: item.status ?? ''),
                    TableActionButton(icon: IconsPath.actonView, onTap: () {}),
                  ];
                });
                return CustomTable(
                  column: controller.requestTableColumn,
                  row: rowWidgets,
                  expandedTableBuilder: (index) {
                    final item = list[index];
                    final rowIndex = index;
                    return CustomTableExpanded(
                      title: 'Request ID: ${item.id ?? ''}',
                      isOpen: rowIndex < controller.expandedData.length
                          ? controller.expandedData[rowIndex]
                          : false,
                      onExpandedClose: () {
                        controller.showExpandedData(rowIndex);
                      },
                      expandedContent: ServiceRequestTableContent(
                        index: rowIndex,
                      ),
                    );
                  },
                  onRowTap: (index) {
                    controller.showExpandedData(index);
                  },
                  isExpandedTableBuilder: (index) {
                    if (index >= controller.expandedData.length) return false;
                    return controller.expandedData[index];
                  },
                  isNeedLastCol: false,
                );
              })(),
            );
    });
  }
}
