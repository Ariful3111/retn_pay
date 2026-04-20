import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_field.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_images.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_info.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class RepairRequestDetails extends GetWidget<RepairRequestController> {
  const RepairRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final data = controller.details.value?.data;
      final status = data?.status?.capitalizeFirst ?? '';
      return Container(
        height: MediaQuery.heightOf(context),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: controller.isLoading.value
            ? Center(child: ButtonLoading())
            : Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 20.w,
                    ),
                    children: [
                      RepairRequestInfo(data: data),
                      SizedBox(height: 24.h),
                      CustomTextPrimary(
                        text: 'Repair Request Details:',
                        fontSize: 20.sp,
                        color: AppColors.primaryColorDark,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextSpan(
                        title: 'Urgency: ',
                        spantext: data?.urgency ?? '',
                        spanColor: AppColors.primaryColorDark,
                        fontSize: 20.sp,
                        spanFontSize: 16.sp,
                      ),
                      SizedBox(height: 16.h),
                      repairRequestField(
                        title: 'Issue Title ',
                        subTitle: data?.title ?? '',
                      ),
                      SizedBox(height: 16.h),
                      repairRequestField(
                        title: 'Issue Details',
                        subTitle: data?.description ?? '',
                      ),
                      SizedBox(height: 16.h),
                      RepairRequestImages(
                        images: data?.images ?? const [],
                        status: status,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: RepairRequestStatus(status: status),
                  ),
                ],
              ),
      );
    });
  }
}
