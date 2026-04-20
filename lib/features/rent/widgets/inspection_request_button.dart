import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/features/rent/widgets/inspection_verification.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class InspectionRequestButton extends GetWidget<PropertyViewController> {
  const InspectionRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasActiveInspectionRequest =
        controller.propertyDetails.value?.data?.hasActiveInspectionRequest ==
        true;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                offset: Offset(0, 5.sp),
                blurRadius: 8.sp,
                spreadRadius: 1.5.sp,
              ),
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                offset: Offset(0, 2.sp),
                blurRadius: 6.sp,
                spreadRadius: 0.5.sp,
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.9),
                offset: Offset(0, -2.sp),
                blurRadius: 5.sp,
              ),
            ],
          ),
          child: CustomSecondaryButton(
            onPressed: () {},
            height: 40.h,
            width: 119.w,
            text: 'Virtual Tour',
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColorDark.withValues(alpha: 0.3),
                offset: Offset(0, 6.sp),
                blurRadius: 12.sp,
                spreadRadius: 2.sp,
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.1),
                offset: Offset(0, -2.sp),
                blurRadius: 8.sp,
              ),
            ],
          ),
          child: CustomPrimaryButton(
            height: 40.h,
            width: hasActiveInspectionRequest ? 200.w : 176.w,
            backgroundColor: hasActiveInspectionRequest
                ? AppColors.basicIconBG
                : null,
            textColor: hasActiveInspectionRequest
                ? AppColors.primaryColorDark
                : null,
            onPressed: () {
              if (hasActiveInspectionRequest == false) {
                if (Get.find<ProfileController>()
                    .profileData
                    .value!
                    .data!
                    .documents!
                    .isNotEmpty) {
                  Get.toNamed(AppRoutes.inspectionFrom);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(child: InspectionVerification());
                    },
                  );
                }
              } else {
                ErrorSnackbar.show(
                  description: 'You already have an active inspection request',
                );
              }
            },
            text: hasActiveInspectionRequest == false
                ? 'Inspection Request'
                : "Inspection in Progress",
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ],
    );
  }
}
