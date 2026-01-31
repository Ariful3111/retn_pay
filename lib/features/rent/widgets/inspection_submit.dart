import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/inspection_form_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class InspectionSubmit extends GetWidget<InspectionFormController> {
  const InspectionSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : CustomPrimaryButton(
              height: 48.h,
              width: 150.w,
              onPressed: () async {
                await controller.submitInspect(context: context);
              },
              text: 'Submit Request',
              borderRadius: BorderRadius.circular(7.22.r),
            );
    });
  }
}
