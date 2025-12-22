import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class TicketTableStatus extends StatelessWidget {
  final int rowIndex;
  const TicketTableStatus({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    final item = supportController.tableData[rowIndex];
    return item.status == 'In Progress'
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: isDark ? AppColors.darkPendingBG : AppColors.pendingBG,
            ),
            child: CustomTextPrimary(
              text: 'In Progress',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.pendingBG : AppColors.pendingText,
              textOverflow: TextOverflow.ellipsis,
            ),
          )
        : TableStatus(status: item.status);
  }
}
