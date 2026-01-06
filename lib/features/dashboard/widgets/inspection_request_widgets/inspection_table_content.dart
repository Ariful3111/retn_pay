import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTableContent extends StatelessWidget {
  final int rowIndex;
  const InspectionTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InspectionRequestController>();
    final item = controller.allRows[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        infoText(title: "Monthly Rent: ${item.rent}"),
        SizedBox(height: 8.h),
        infoText(title: "Scheduled: ${item.scheduleDate}"),
        SizedBox(height: 8.h),
        infoText(title: "Inspection Type: ${item.type}"),
        SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            TableStatus(status: item.status),
          ],
        ),
        SizedBox(height: 8.h),
        infoText(title: "Action"),
        SizedBox(height: 8.h),
        InspectionActionButton(rowIndex: rowIndex),
        SizedBox(height: 12.h),
      ],
    );
  }

  infoText({required String title}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
