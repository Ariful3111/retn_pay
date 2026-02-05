import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_button.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyDetails extends GetWidget<AddNewPropertyController> {
  const AddNewPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Property Details:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.descriptionController,
            label: 'Property Description*',
            maxLine: 9,
            isAlignLabelWithHint: true,
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.featureController,
            label: 'Property Feature*',
          ),
          SizedBox(height: 12.h),
          addMoreButton(onAdd: controller.addFeature),
          Obx(() {
            if (controller.featureList.isEmpty) {
              return SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(controller.featureList.length, (index) {
                  final feature = controller.featureList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CustomTextPrimary(
                      text: '${index + 1}. $feature',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark ? null : AppColors.darkContainer,
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}
