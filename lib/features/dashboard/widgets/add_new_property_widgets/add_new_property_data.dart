import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_field.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AddNewPropertyData extends StatelessWidget {
  const AddNewPropertyData({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPropertyController addNewPropertyController = Get.find();
    return AddNewPropertyContainer(
      child: Column(
        children: [
          CustomDropdownMenu(
            alignmentGeometry: Alignment(0.2, 1),
            onSelect: (value) {
              addNewPropertyController.selectedProperty.value = value!;
            },
            option: addNewPropertyController.propertyType,
            isSelect: addNewPropertyController.selectedProperty,
            textAlign: TextAlign.left,
            label: CustomTextSecondary(text: 'Property Type'),
          ),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.nameController, label: 'Property Name',),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.unitController, label: 'Unit Name',),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.areaController, label: 'Area Size(sft)',),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.rentController, label: 'Monthly Rent',),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.bedController, label: 'Bed',),
          SizedBox(height: 20.h,),
          AddNewPropertyInfoField(controller: addNewPropertyController.bathController, label: 'BathRoom',),
        ],
      ),
    );
  }
}
