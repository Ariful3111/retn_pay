import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table_action.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ServiceBookedTable extends GetWidget<ServiceBookedController> {
  const ServiceBookedTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? const Center(child: ButtonLoading())
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
              ),
              child: _table(),
            );
    });
  }

  Widget _table() {
    final list = controller.bookings.value?.data?.data ?? const <BookingItem>[];
    final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
      final item = list[index];
      return [
        CustomTextPrimary(
          text: item.service?.title ?? '',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
        ),
        TableStatus(status: item.status ?? ''),
        ServiceBookedTableAction(
          serviceTypeID: item.service?.serviceTypeId ?? 0,
          bookingItem: item,
        ),
      ];
    });
    return CustomTable(
      column: controller.tableColumn,
      row: rowWidgets,
      expandedTableBuilder: (index) {
        final item = list[index];
        final rowIndex = index;
        return CustomTableExpanded(
          title: 'Service Name: ${item.service?.title ?? ''}',
          isOpen: rowIndex < controller.expandedData.length
              ? controller.expandedData[rowIndex]
              : false,
          onExpandedClose: () {
            controller.showExpandedData(rowIndex);
          },
          expandedContent: ServiceBookedTableContent(rowIndex: rowIndex),
        );
      },
      onRowTap: (index) {
        controller.showExpandedData(index);
      },
      isExpandedTableBuilder: (index) {
        if (index >= controller.expandedData.length) {
          return false;
        }
        return controller.expandedData[index];
      },
      isNeedLastCol: true,
    );
  }
}
