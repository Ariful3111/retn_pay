import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_images.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_info.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_request_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class RepairRequestDetails extends StatelessWidget {
  const RepairRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddRepairRequestController addRepairRequestController = Get.find();
    return Container(
      height: MediaQuery.heightOf(context),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
      ),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
            children: [
              RepairRequestInfo(),
              SizedBox(height: 24.h),
              CustomTextPrimary(
                text: 'Repair Request Details:',
                fontSize: 20.sp,
                color: AppColors.primaryColorDark,
              ),
              SizedBox(height: 12.h),
              CustomTextSpan(
                title: 'Urgency: ',
                spantext:
                    addRepairRequestController
                        .requestType[addRepairRequestController
                        .selectedIndex
                        .value],
                spanColor: AppColors.primaryColorDark,
                fontSize: 20.sp,
                spanFontSize: 20.sp,
              ),
              SizedBox(height: 16.h),
              fieldText(
                title: 'Issue Title ',
                subTitle: addRepairRequestController.issueTitleController.text,
              ),
              SizedBox(height: 16.h),
              fieldText(
                title: 'Issue Details',
                subTitle:
                    addRepairRequestController.issueDetailsController.text,
              ),
              SizedBox(height: 16.h),
              RepairRequestImages(),
            ],
          ),
          Positioned(right: 10.w, top: 10.h, child: RepairRequestStatus()),
        ],
      ),
    );
  }

  Widget fieldText({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title, color: AppColors.darkLightText),
        SizedBox(height: 4.h),
        CustomTextPrimary(
          text: subTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
