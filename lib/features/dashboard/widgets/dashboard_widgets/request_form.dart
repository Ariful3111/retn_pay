import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Column(
      children: [
        CustomTextField(
          controller: dashboardController.addressController,
          hintText: 'Enter your address',
          labelText: 'Problem Address',
          textColor: AppColors.secondaryTextColor,
        ),
        SizedBox(height: 10,),
        CustomTextField(
          controller: dashboardController.descriptionController,
          hintText: 'Write your problem in detail',
          labelText: 'Problem Description',
          maxLines: 2,
          hintDirection: TextDirection.ltr,
          isAlignLabelWithHint: true,
        ),
      ],
    );
  }
}
