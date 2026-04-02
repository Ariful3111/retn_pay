import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/booking_management_table_content.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class BookingManagementTable extends StatelessWidget {
  const BookingManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    BookingManagementController bookingManagementController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final list = bookingManagementController.filterRow;
        final rowWidgets = List<List<Widget>>.generate(list.length, (index) {
          final item = list[index].value;
          return [
            CustomTextPrimary(
              text: item.serviceName,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TableStatus(status: item.status),
            TableActionButton(
              icon: IconsPath.actonView,
              onTap: () {
                Get.toNamed(AppRoutes.bookingManagementDetailsView);
              },
            ),
          ];
        });
        final listIndex = list.map((e) => e.key).toList();
        return CustomTable(
          column: bookingManagementController.tableColumn,
          row: rowWidgets,
          expandedTableBuilder: (index) {
            final item = list[index].value;
            final rowIndex = listIndex[index];
            return CustomTableExpanded(
              title: 'Service Name: ${item.serviceName}',
              isOpen: bookingManagementController.expanded[rowIndex],
              onExpandedClose: () {
                bookingManagementController.toggleExpanded(rowIndex);
              },
              expandedContent: BookingManagementTableContent(index: rowIndex),
            );
          },
          onRowTap: (index) {
            bookingManagementController.toggleExpanded(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return bookingManagementController.expanded[listIndex[index]];
          },
          isNeedLastCol: false,
        );
      }),
    );
  }
}
