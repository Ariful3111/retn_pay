import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class RequestForm extends GetWidget<AddRepairRequestController> {
  const RequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.issueTitleController,
          hintText: 'Enter issue title',
          labelText: 'Issue Title',
        ),
        SizedBox(height: 10),
        CustomTextField(
          controller: controller.issueDetailsController,
          hintText: 'Write your problem in detail',
          labelText: 'Issue Description',
          maxLines: 2,
          hintDirection: TextDirection.ltr,
          isAlignLabelWithHint: true,
        ),
      ],
    );
  }
}
