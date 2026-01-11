import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/rent_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class RentManagementTableContent extends StatelessWidget {
  final int index;
  const RentManagementTableContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    RentManagementController rentManagementController = Get.find();
    final item = rentManagementController.allRows[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h,),
        infoText(title: 'Landlord Name: ${item.landlordName}'),
        SizedBox(height: 8.h,),
        infoText(title: 'Landlord Email: ${item.landlordEmail}'),
        SizedBox(height: 8.h,),
        infoText(title: 'Landlord Phone No: ${item.landlordPhone}'),
      ],);
  }

  infoText({required String title}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
