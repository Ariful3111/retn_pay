import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_maintenance_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairMaintenanceTableStatus extends StatelessWidget {
  final int rowIndex;
  const RepairMaintenanceTableStatus({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    RepairMaintenanceController repairMaintenanceController = Get.find();
    final list = repairMaintenanceController.requests;
    if (rowIndex < 0 || rowIndex >= list.length) {
      return SizedBox.shrink();
    }
    final item = list[rowIndex];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final status = item.status?.toLowerCase();
    final isInProgress = status == 'in progress';
    final isPending = status == 'pending';

    // Show "In Progress" badge only for 'in progress' status
    if (isInProgress) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: isDark ? AppColors.darkCompleteBG : AppColors.completeBG,
        ),
        child: CustomTextPrimary(
          text: 'In Progress',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.completeBG : AppColors.completeText,
          textOverflow: TextOverflow.ellipsis,
        ),
      );
    }

    // Show pending status normally
    if (isPending) {
      return TableStatus(status: 'Pending');
    }

    // Show other statuses normally
    return TableStatus(status: item.status?.capitalizeFirst ?? '');
  }
}
