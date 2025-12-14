import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_maintenance_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RepairMaintenanceTableContent extends StatelessWidget {
  final int rowIndex;
  const RepairMaintenanceTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    RepairMaintenanceController repairMaintenanceController = Get.find();
    final item = repairMaintenanceController.dataList[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        info(text: 'Request Type: ${item.type}'),
        SizedBox(height: 8.h),
        info(text: 'Issue Date: ${item.date}'),
        SizedBox(height: 8.h),
        Row(
          children: [
            info(text: 'Status'),
            SizedBox(width: 8.w),
            TableStatus(status: item.status),
          ],
        ),
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
          onPressed: () {
            
          },
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
