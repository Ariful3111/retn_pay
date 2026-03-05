import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordInspectionTableContent extends StatelessWidget {
  final int index;
  const LandlordInspectionTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InspectionRequestController>();
    final list = controller.inspections.value?.data ?? const [];
    final itemIndex = list.indexWhere((element) => element.id == index);
    if (itemIndex == -1) {
      return const SizedBox.shrink();
    }
    final item = list[itemIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: 'Name: ${item.tenant?.name ?? ''}'),
        SizedBox(height: 8.h),
        infoText(title: 'Email: ${item.tenant?.email ?? ''}'),
        SizedBox(height: 8.h),
        infoText(title: 'Phone No:'),
        SizedBox(height: 8.h),
        if (userIndex == 2)
          infoText(title: 'Scheduled: ${item.inspectionDate ?? ''}'),
        if (userIndex == 2) SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            TableStatus(status: item.status?.capitalizeFirst ?? ''),
          ],
        ),
        SizedBox(height: 8.h),
        infoText(title: 'Inspection Type: ${item.type?.capitalizeFirst ?? ''}'),
        SizedBox(height: 8.h),
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
