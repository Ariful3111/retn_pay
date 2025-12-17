import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/service_booked_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/service_booked_table.dart';
import 'package:renter_pay/features/dashboard/widgets/service_booked_type.dart';
class ServiceBookedView extends StatelessWidget {
  const ServiceBookedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 16.h,),
        ServiceBookedType(),
        SizedBox(height: 12.h,),
        ServiceBookedFilter(),
        SizedBox(height: 20.h,),
        ServiceBookedTable(),
      ],
      );
  }
}