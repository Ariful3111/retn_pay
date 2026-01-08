import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordRepairMaintenanceUploadDialog extends StatelessWidget {
  const LandlordRepairMaintenanceUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      height: 306.h,
      isBG: false,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextPrimary(text: 'Upload Receipt', fontSize: 24.sp),
          SizedBox(height: 6.h),
          CustomTextPrimary(
            text: 'Repairs and Maintenance Receipt',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 18.h),
          Divider(color: Color(0xFFF2F2F2)),
          SizedBox(height: 22.h),
          CustomTextSecondary(
            text: 'Upload Repairs and Maintenance Receipt',
            fontSize: 14.sp,
          ),
          SizedBox(height: 4.h),
          CustomAttachedImage(
            height: 53.h,
            width: 200.w,
            verticalPadding: 5.h,
            imageList:
                Get.find<LandlordRepairMaintenanceController>().imageList,
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: CustomPrimaryButton(
              onPressed: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.repairRequestView);
              },
              height: 52.h,
              width: 120.w,
              borderRadius: BorderRadius.circular(8.r),
              text: 'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
