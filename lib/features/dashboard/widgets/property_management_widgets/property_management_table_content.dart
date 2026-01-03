import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyManagementTableContent extends StatelessWidget {
  final int rowIndex;
  const PropertyManagementTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    final item = propertyManagementController.allRows[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Row(
          children: [
            infoText(title: 'Verification Status:'),
            SizedBox(width: 4.w),
            TableStatus(status: item.verifyStatus),
          ],
        ),
        SizedBox(height: 8.h),
        infoText(title: "Monthly Rent: ${item.rent}"),
        SizedBox(height: 8.h),
        infoText(title: "Agent: ${item.agent}"),
        SizedBox(height: 8.h),
        if (item.verifyStatus == 'Approved') ...[
          SizedBox(height: 8.h),
          Row(
            children: [
              infoText(title: "Enlisting Status:"),
              SizedBox(width: 6.w),
              TableStatus(status: item.enlistStatus),
            ],
          ),
        ],
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
