import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attached_image.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/success_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementConditionalReport extends StatelessWidget {
  const PropertyManagementConditionalReport({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    return SuccessDialog(
      height: 365.h,
      isBG: false,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextPrimary(text: 'Condition Report', fontSize: 24.sp),
          SizedBox(height: 6.h),
          CustomTextPrimary(
            text: 'Upload Condition Report',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 4.88.h),
          Divider(color: AppColors.whiteBorder),
          SizedBox(height: 13.12.h),
          CustomDropdownMenu(
            alignmentGeometry: Alignment(0.5, 1),
            offset: Offset(-70.w, 2.h),
            label: CustomTextSecondary(text: 'Selected Property'),
            textColor: AppColors.darkContainer,
            onSelect: (value) {
              propertyManagementController.selectedProperty.value = value!;
            },
            option: propertyManagementController.propertyOption,
            isSelect: propertyManagementController.selectedProperty,
          ),
          SizedBox(height: 20.h),
          CustomTextSecondary(text: 'Upload Condition Report'),
          SizedBox(height: 4.h),
          CustomAttachedImage(
            imageList: propertyManagementController.imageList,
          ),
          SizedBox(height: 4.h),
          CustomTextSecondary(
            text: '*Only PDF files are supported (Max size: 10MB)',
            color: AppColors.primaryColorDark,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: CustomPrimaryButton(
              height: 52.h,
              width: 120.w,
              borderRadius: BorderRadius.circular(8.r),
              text: 'Submit',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
