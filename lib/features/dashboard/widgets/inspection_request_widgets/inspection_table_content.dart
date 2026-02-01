import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_action_button.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class InspectionTableContent extends GetWidget<InspectionRequestController> {
  final int id;
  const InspectionTableContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final list = controller.inspections.value?.data ?? [];
    final itemIndex = list.indexWhere((element) => element.id == id);
    if (itemIndex == -1) {
      return SizedBox.shrink();
    }
    final item = list[itemIndex];
    final units = item.property?.units ?? [];
    final monthlyRent = units.isNotEmpty ? units.first.rentAmount : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        infoText(
          title: "Monthly Rent: ${monthlyRent ?? 'N/A'}",
        ),
        SizedBox(height: 8.h),
        infoText(title: "Scheduled: ${item.inspectionDate}"),
        SizedBox(height: 8.h),
        infoText(title: "Inspection Type: ${item.type?.capitalizeFirst ?? ""}"),
        SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            TableStatus(status: item.status?.capitalizeFirst ?? ""),
          ],
        ),
        SizedBox(height: 8.h),
        infoText(title: "Action"),
        SizedBox(height: 8.h),
        InspectionActionButton(id: id),
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
