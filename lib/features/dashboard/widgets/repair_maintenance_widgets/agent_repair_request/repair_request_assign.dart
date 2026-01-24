import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_field.dart';

class RepairRequestAssign extends StatelessWidget {
  const RepairRequestAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        repairRequestField(title: 'Name:', subTitle: 'Sadman Sakib'),
        SizedBox(height: 20.h,),
        repairRequestField(title: 'Contact Number:', subTitle: '+1 555-987-6543'),
      ],
    );
  }
}