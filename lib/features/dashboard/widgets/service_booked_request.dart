import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/service_details_container.dart';

class ServiceBookedRequest extends StatelessWidget {
  const ServiceBookedRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceDetailsContainer(
      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
      child: Column(),);
  }
}