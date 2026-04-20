import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/update_repair_status_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/submit_rating_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class RepairRequestService extends GetWidget<RepairRequestController> {
  const RepairRequestService({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = controller.details.value?.data?.assignments;
    final assignment = (assignments != null && assignments.isNotEmpty)
        ? assignments.first
        : null;
    final vendor = assignment?.vendor;
    final assignedTo = vendor?.name ?? '';
    final contact = vendor?.email ?? '';
    final maintenanceID = assignment?.id ?? '';
    final status = controller.details.value?.data?.status;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSpan(
          title: 'Assigned To: ',
          spantext: assignedTo,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          spanFontSize: 20.sp,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
        ),
        SizedBox(height: 8.h),
        CustomTextSpan(
          title: 'Contact: ',
          spantext: contact,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          spanFontSize: 20.sp,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
        ),
        SizedBox(height: 24.h),
        status == "completed"
            ? SizedBox()
            : Obx(() {
                return Get.find<UpdateRepairRequestController>().isLoading.value
                    ? ButtonLoading()
                    : CustomPrimaryButton(
                        height: 40.h,
                        width: 169.w,
                        borderRadius: BorderRadius.circular(6.r),
                        text: 'Mark as Complete',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SubmitRatingDialog(
                                rating: CustomRatingBuilder(
                                  onRating: (value) {
                                    Get.find<UpdateRepairRequestController>()
                                            .rating
                                            .value =
                                        value;
                                  },
                                  initialRating:
                                      Get.find<UpdateRepairRequestController>()
                                          .rating
                                          .value,
                                ),
                                ratingTitle: 'Rate The Service Provider',
                                onTap: () async {
                                  Get.back();
                                  await Get.find<
                                        UpdateRepairRequestController
                                      >()
                                      .updateRepairStatus(
                                        maintenanceRequestID: maintenanceID
                                            .toString(),
                                        statusChange: 'completed',
                                        message:
                                            'Maintenance request completed.',
                                      );
                                },
                                writeReview: true,
                                controller:
                                    Get.find<UpdateRepairRequestController>()
                                        .reviewController,
                                cancelButton: CustomSecondaryButton(
                                  text: 'Cancel',
                                  height: 40.h,
                                  width: 85.w,
                                  borderRadius: BorderRadius.circular(6.r),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                buttonSpace: SizedBox(width: 16.w),
                              );
                            },
                          );
                        },
                      );
              }),
      ],
    );
  }
}
