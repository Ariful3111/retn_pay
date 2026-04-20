import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/booking_model.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/booking_management_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class BookingManagementTable extends GetView<BookingManagementController> {
  const BookingManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: ButtonLoading());
      }

      final list = controller.filterRow;
      if (list.isEmpty) {
        return Center(
          child: CustomTextPrimary(text: 'No bookings found', fontSize: 14.sp),
        );
      }

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: _buildTable(list, isDark),
      );
    });
  }

  Widget _buildTable(List<BookingItem> list, bool isDark) {
    final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
      final item = list[index];
      return [
        CustomTextPrimary(
          text: item.service?.title ?? '-',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textOverflow: TextOverflow.ellipsis,
        ),
        TableStatus(status: item.status ?? '-'),
        TableActionButton(
          icon: IconsPath.actonView,
          onTap: () {
            // Pass the entire BookingItem to details view
            Get.toNamed(
              AppRoutes.bookingManagementDetailsView,
              arguments: item,
            );
          },
        ),
      ];
    });

    return CustomTable(
      column: controller.tableColumn,
      row: rowWidgets,
      expandedTableBuilder: (index) {
        final item = list[index];
        return CustomTableExpanded(
          title: 'Service Name: ${item.service?.title ?? '-'}',
          isOpen: controller.expanded[index],
          onExpandedClose: () {
            controller.toggleExpanded(index);
          },
          expandedContent: BookingManagementTableContent(bookingItem: item),
        );
      },
      onRowTap: (index) {
        controller.toggleExpanded(index);
      },
      isExpandedTableBuilder: (index) {
        return controller.expanded[index];
      },
      isNeedLastCol: false,
    );
  }
}
