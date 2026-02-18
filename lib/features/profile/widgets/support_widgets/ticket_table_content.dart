import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/widgets/support_widgets/ticket_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TicketTableContent extends StatelessWidget {
  final int rowIndex;
  const TicketTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    SupportController supportController = Get.find();
    final tickets = supportController.tickets.value?.data?.data ?? const [];
    final item = (rowIndex >= 0 && rowIndex < tickets.length)
        ? tickets[rowIndex]
        : null;

    String displayStatus(String? status) {
      final value = status?.trim().toLowerCase();
      if (value == 'open') return 'Open';
      if (value == 'in_progress') return 'In Progress';
      if (value == 'resolved') return 'Resolved';
      if (value == 'closed') return 'Closed';
      return status?.trim().isNotEmpty == true ? status!.trim() : 'Open';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        info(text: 'Category: ${item?.priority ?? '-'}'),
        SizedBox(height: 8.h),
        info(text: 'Issue Title: ${item?.subject ?? '-'}'),
        SizedBox(height: 8.h),
        Row(
          children: [
            info(text: 'Status'),
            SizedBox(width: 8.w),
            TicketTableStatus(status: displayStatus(item?.status)),
          ],
        ),
        SizedBox(height: 8.h),
        info(text: 'Issue Date: ${item?.createdAt ?? '-'}'),
        SizedBox(height: 8.h),
        CustomTextPrimary(
          text: 'Action',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryButton(
          text: 'View',
          height: 37.h,
          width: 63.w,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textColor: AppColors.darkAppBar,
          borderRadius: BorderRadius.circular(6.r),
          onPressed: () {},
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  info({required String text}) {
    return CustomTextPrimary(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
