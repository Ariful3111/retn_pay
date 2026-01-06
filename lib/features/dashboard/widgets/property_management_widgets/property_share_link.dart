import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyShareLink extends StatelessWidget {
  const PropertyShareLink({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextPrimary(text: 'Create shareable link', fontSize: 20.sp),
              SizedBox(width: 12.w),
              CustomSwitchButton(
                isOn: propertyManagementController.isShare.value,
                onChanged: (value) {
                  propertyManagementController.isShare.value = value;
                },
              ),
            ],
          ),
          SizedBox(height: 12.h),
         if(propertyManagementController.isShare.value) SizedBox(
            height: 40.h,
            child: CustomTextField(
              controller: propertyManagementController.shareController,
              fillColor: isDark?AppColors.darkPrimary:AppColors.whiteColor,
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(height: 12.h,),
          if(propertyManagementController.isShare.value)Align(
            alignment: Alignment.centerRight,
            child: CustomPrimaryButton(
              height: 40.h,
              width: 67.w,
              text: 'Copy',
              onPressed: () {
              
            },),
          )
        ],
      ),
    );
  }
}
