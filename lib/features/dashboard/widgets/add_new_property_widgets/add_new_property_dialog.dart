import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class AddNewPropertyDialog extends GetWidget<AddNewPropertyController> {
  const AddNewPropertyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessDialog(
      isBG: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.error, height: 46.h, width: 46.w),
          SizedBox(height: 14.h),
          CustomTextPrimary(
            text: 'Rent Amount: \$${controller.rentController.text}',
            fontSize: 18.sp,
            color: Color(0xFFB57C00),
          ),
          SizedBox(height: 6.h),
          CustomTextPrimary(
            text: 'Rent Update Warning',
            fontSize: 20.sp,
            color: AppColors.primaryColorDark,
          ),
          SizedBox(height: 6.h),
          CustomTextSecondary(
            text:
                'Once updated, the rent amount cannot be changed again for 6 months.',
            textAlign: TextAlign.center,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5D6B82),
          ),
          SizedBox(height: 28.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSecondaryButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                height: 40.h,
                width: 85.w,
                borderRadius: BorderRadius.circular(6.r),
              ),
              SizedBox(width: 16.w),
              Obx(() {
                return controller.isLoadingAddProperty.value
                    ? ButtonLoading()
                    : CustomPrimaryButton(
                        onPressed: () async {
                          await controller.addProperty();
                        },
                        text: 'Confirm & Update',
                        height: 40.h,
                        width: 166.w,
                        borderRadius: BorderRadius.circular(6.r),
                      );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
