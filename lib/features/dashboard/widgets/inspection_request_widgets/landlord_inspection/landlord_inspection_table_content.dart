import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_inspection_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class LandlordInspectionTableContent extends StatelessWidget {
  final int index;
  const LandlordInspectionTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    LandlordInspectionRequestController landlordInspectionRequestController =
        Get.find();
    final item = landlordInspectionRequestController.allRows[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: 'Name: ${item.name}'),
        SizedBox(height: 8.h),
        infoText(title: 'Email: ${item.email}'),
        SizedBox(height: 8.h),
        infoText(title: 'Phone No: ${item.phone}'),
        SizedBox(height: 8.h),
       if(userIndex==2) infoText(title: 'Scheduled: ${item.scheduleDate}'),
        if(userIndex==2) SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: "Status"),
            SizedBox(width: 8.w),
            TableStatus(status: item.status),
          ],
        ),
        SizedBox(height: 8.h),
        infoText(title: 'Inspection Type: ${item.type}'),
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
