import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_table_content.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TicketTable extends StatelessWidget {
  const TicketTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        final rowList = supportController.filterData;
        final rowWidgets = List<List<Widget>>.generate(rowList.length, (
          index,
        ) {
          final item = rowList[index].value;
          final listIndex = rowList.map((e) => e.key).toList();
          return [
            CustomTextPrimary(
              text: item.ticketID,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            CustomTextPrimary(
              text: item.category,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TicketTableStatus(rowIndex: listIndex[index]),
            CustomPrimaryButton(
              text: 'View',
              height: 37.h,
              width: 63.w,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColors.darkAppBar,
              borderRadius: BorderRadius.circular(6.r),
              onPressed: () {
                supportController.showExpandedData(
                  listIndex[index],
                );
              },
            ),
          ];
        });
        final listIndex = rowList.map((e) => e.key).toList();
        return CustomTable(
          column: supportController.tableColumn,
          row: rowWidgets,
          listIndex: listIndex,
          onRowTap: (index) {
            supportController.showExpandedData(listIndex[index]);
          },
          isExpandedTableBuilder: (index) {
            return supportController.expandedData[listIndex[index]];
          },
          expandedTableBuilder: (index) {
            final item = rowList[index].value;
            return CustomTableExpanded(
              title: 'Ticket ID: ${item.ticketID}',
              isOpen:
                  supportController.expandedData[listIndex[index]],
              onExpandedClose: () {
                supportController.showExpandedData(
                  listIndex[index],
                );
              },
              expandedContent: TicketTableContent(
                rowIndex: listIndex[index],
              ),
            );
          }, isNeedLastCol: true,
        );
      }),
    );
  }
}
