import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/home/controllers/property_amenities_controller.dart';
import 'package:renter_pay/shared/widgets/custom_check_box.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class AddNewPropertyFeatures extends GetWidget<AddNewPropertyController> {
  const AddNewPropertyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var propertyAmenities =
        Get.find<PropertyAmenitiesController>().propertyAmenities.value?.data;
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Key Features & Amenities:',
            fontSize: 20.sp,
            color: isDark ? null : AppColors.darkContainer,
          ),
          SizedBox(height: 12.h),
          ...List.generate(propertyAmenities?.length ?? 0, (index) {
            return Obx(() {
              bool isChecked = controller.selectedFeature.contains(
                propertyAmenities?[index].id ?? 0,
              );
              return Row(
                children: [
                  CustomCheckBox(
                    isChecked: isChecked,
                    onChange: (value) {
                      if (value) {
                        controller.selectedFeature.add(
                          propertyAmenities?[index].id ?? 0,
                        );
                      } else {
                        controller.selectedFeature.remove(
                          propertyAmenities?[index].id ?? 0,
                        );
                      }
                    },
                  ),
                  CustomTextPrimary(
                    text: propertyAmenities?[index].name ?? '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              );
            });
          }),
        ],
      ),
    );
  }
}
