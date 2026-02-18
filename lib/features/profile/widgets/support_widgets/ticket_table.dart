import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table.dart';
import 'package:renter_pay/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TicketTable extends GetWidget<SupportController> {
  const TicketTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Obx(() {
        String displayStatus(String? status) {
          final value = status?.trim().toLowerCase();
          if (value == 'open') return 'Open';
          if (value == 'in_progress') return 'In Progress';
          if (value == 'resolved') return 'Resolved';
          if (value == 'closed') return 'Closed';
          return status?.trim().isNotEmpty == true ? status!.trim() : 'Open';
        }

        if (controller.isLoading.value) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final tickets = controller.tickets.value?.data?.data ?? const [];
        final rowWidgets = List<List<Widget>>.generate(tickets.length, (index) {
          final item = tickets[index];
          return [
            CustomTextPrimary(
              text: item.id.toString(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.ellipsis,
            ),
            CustomTextPrimary(
              text: item.priority?.toString().capitalizeFirst ?? '-',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.ellipsis,
            ),
            TicketTableStatus(status: displayStatus(item.status)),
            CustomPrimaryButton(
              text: 'View',
              height: 37.h,
              width: 63.w,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColors.darkAppBar,
              borderRadius: BorderRadius.circular(6.r),
              onPressed: () {
                controller.toggleExpandedTicket(id: item.id ?? 0);
              },
            ),
          ];
        });

        return CustomTable(
          column: controller.tableColumn,
          row: rowWidgets,
          onRowTap: (index) {
            controller.toggleExpandedTicket(id: tickets[index].id ?? 0);
          },
          isExpandedTableBuilder: (index) {
            return controller.expandedTickets.contains(tickets[index].id ?? 0);
          },
          expandedTableBuilder: (index) {
            final item = tickets[index];
            final id = item.id ?? 0;
            final isOpen = controller.expandedTickets.contains(id);
            return CustomTableExpanded(
              title: 'Ticket ID: $id',
              isOpen: isOpen,
              onExpandedClose: () {
                controller.toggleExpandedTicket(id: id);
              },
              expandedContent: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPrimary(
                      text: item.subject?.toString() ?? '',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    if ((item.description ?? '').trim().isNotEmpty)
                      CustomTextPrimary(
                        text: item.description!.trim(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomTextPrimary(
                          text: 'Status: ',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TicketTableStatus(status: displayStatus(item.status)),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    if (item.user != null)
                      CustomTextPrimary(
                        text:
                            'User: ${item.user!.name ?? ''}${(item.user!.email ?? '').isNotEmpty ? ' • ${item.user!.email}' : ''}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    if ((item.replies ?? []).isNotEmpty) ...[
                      SizedBox(height: 12.h),
                      CustomTextPrimary(
                        text: 'Replies',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 8.h),
                      ...item.replies!.map(
                        (r) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: CustomTextPrimary(
                            text: '${r.user?.name ?? ''}: ${r.message ?? ''}'
                                .trim(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
          isNeedLastCol: true,
        );
      }),
    );
  }
}
