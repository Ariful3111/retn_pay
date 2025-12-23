import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/add_repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_radio_button.dart';

class RequestType extends StatelessWidget {
  const RequestType({super.key});

  @override
  Widget build(BuildContext context) {
    AddRepairRequestController addRepairRequestController = Get.find();
    return Row(
      children: List.generate(addRepairRequestController.requestType.length, (
        index,
      ) {
        return Obx(()=> CustomRadioButton(
          value: index,
          groupValue: addRepairRequestController.selectedIndex.value,
          onChange: (value) {
            addRepairRequestController.selectedIndex.value = value!;
          },
          text: addRepairRequestController.requestType[index],
        ),);
      }),
    );
  }
}
