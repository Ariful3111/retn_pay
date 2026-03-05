import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementTableContent
    extends GetWidget<ApplicationManagementController> {
  final int index;
  const ApplicationManagementTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final list = controller.items;
    final itemIndex = list.indexWhere((e) => (e.id ?? 0) == index);
    if (itemIndex == -1) return const SizedBox.shrink();
    final item = list[itemIndex];
    final status = item.status ?? '';
    final name =
        item.tenant?.name ??
        item.applicationDetails?.applicantDetails?.name ??
        '';
    final remark = item.rejectionReason ?? item.notes ?? '';
    final isRejected =
        (item.status ?? '').toLowerCase() == 'rejected' ||
        status.toLowerCase() == 'rejected';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: 'Name: $name'),
        SizedBox(height: 8.h),
        if (isRejected) infoText(title: 'Remark: $remark'),
        if (isRejected) SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            ApplicationManagementTableStatus(status: status),
          ],
        ),
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
