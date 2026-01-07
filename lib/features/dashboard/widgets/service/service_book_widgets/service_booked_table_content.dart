import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_table_action.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceBookedTableContent extends StatelessWidget {
  final int rowIndex;
  const ServiceBookedTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    ServiceBookedController serviceBookedController = Get.find();
    final item = serviceBookedController.bookedList[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        infoText(title: "ServiceProviderContact: ${item.serviceProviderContact}"),
        SizedBox(height: 8.h),
        infoText(title: "Scheduled: ${item.schedule}"),
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
        ServiceBookedTableAction(),
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

