import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_field.dart';
import 'package:renter_pay/features/home/controllers/property_category_controller.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AddNewPropertyData extends GetWidget<AddNewPropertyController> {
  const AddNewPropertyData({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNewPropertyContainer(
      child: Column(
        children: [
          CustomDropdownMenu(
            alignmentGeometry: Alignment(0.1, 1),
            onSelect: (value) {
              controller.selectedProperty.value = value!;
            },
            option:
                Get.find<PropertyCategoryController>()
                    .propertyCategories
                    .value
                    ?.data
                    ?.map((e) => e.name ?? '')
                    .toList() ??
                [],
            isSelect: controller.selectedProperty,
            textAlign: TextAlign.left,
            label: CustomTextSecondary(text: 'Property Type'),
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.nameController,
            label: 'Property Name',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.unitController,
            label: 'Unit Name',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.areaController,
            label: 'Area Size(sft)',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.rentController,
            label: 'Monthly Rent',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.bedController,
            label: 'Bed',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: controller.bathController,
            label: 'BathRoom',
          ),
        ],
      ),
    );
  }
}
