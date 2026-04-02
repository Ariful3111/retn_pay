import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_update_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class LandlordInspectionViewButton
    extends GetWidget<InspectionDetailsController> {
  LandlordInspectionViewButton({super.key});

  final updateController = Get.find<InspectionUpdateController>();

  @override
  Widget build(BuildContext context) {
    final data = controller.inspectionDetails.value?.data;
    final status = data?.status;
    final inspectionId = data?.id;

    final bool showActionButtons = status == 'pending';

    if (!showActionButtons) {
      return SizedBox();
    }

    return Obx(() {
      if (updateController.isLoading.value) {
        return ButtonLoading();
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPrimaryButton(
            onPressed: () async {
              await updateController.updateInspection(
                status: 'completed',
                id: inspectionId!,
              );
            },
            height: 52.h,
            width: 127.w,
            text: 'Approve',
            borderRadius: BorderRadius.circular(8.r),
          ),
          SizedBox(width: 20.w),
          CustomSecondaryButton(
            onPressed: () async {
              await updateController.updateInspection(
                status: 'cancelled',
                id: inspectionId!,
              );
            },
            height: 52.h,
            width: 127.w,
            text: 'Decline',
            borderRadius: BorderRadius.circular(8.r),
          ),
        ],
      );
    });
  }
}
