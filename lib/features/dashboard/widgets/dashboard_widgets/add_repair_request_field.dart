import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class AddRepairRequestField extends StatelessWidget {
  const AddRepairRequestField({super.key});

  @override
  Widget build(BuildContext context) {
    AddRepairRequestController addRepairRequestController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          controller: addRepairRequestController.issueTitleController,
          hint: 'Enter Your Issue Title',
          label: 'Issue Title',
        ),
        SizedBox(height: 16.h,),
        myField(controller: addRepairRequestController.issueDetailsController, hint: 'Enter Your Issue In Details', label: 'Issue Details',maxLine: 7,isAlignLabelWithHint: true),
      ],
    );
  }

  Widget myField({
    required TextEditingController controller,
    required String hint,
    required String label,
    int ? maxLine,
    bool ? isAlignLabelWithHint,
  }) {
    return CustomTextField(
      hintText: hint,
      labelText: label,
      controller: controller,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide.none,
      ),
      enableBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide.none,
      ),
      focusBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide.none,
      ),
      maxLines: maxLine,
      isAlignLabelWithHint: isAlignLabelWithHint,
    );
  }
}
