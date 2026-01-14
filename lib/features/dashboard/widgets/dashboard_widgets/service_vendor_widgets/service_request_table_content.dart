import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_vendor_dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceRequestTableContent extends StatelessWidget {
  final int index;
  const ServiceRequestTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ServiceVendorDashboardController serviceVendorDashboardController =
        Get.find();
    final item = serviceVendorDashboardController.upcomingList[index];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      infoText(title: 'Address: ${item.address}'),
      SizedBox(height: 8.h,),
      infoText(title: 'Schedule: ${item.schedule}')
    ]);
  }
  infoText({required String title}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
