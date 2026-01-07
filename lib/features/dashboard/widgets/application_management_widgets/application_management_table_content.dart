import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ApplicationManagementTableContent extends StatelessWidget {
  final int index;
  const ApplicationManagementTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ApplicationManagementController applicationManagementController =
        Get.find();
    final item = applicationManagementController.allRows[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: 'Name: ${item.name}'),
        SizedBox(height: 8.h),
       if(item.status=='Rejected') infoText(title: 'Remark: ${item.remark}'),
       if(item.status=='Rejected') SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            ApplicationManagementTableStatus(status: item.status),
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
