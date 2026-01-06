import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_container.dart';
import 'package:renter_pay/features/dashboard/widgets/add_new_property_widgets/add_new_property_info_field.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class AddNewPropertyAddress extends StatelessWidget {
  const AddNewPropertyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController = Get.find();
    return AddNewPropertyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Property Address:',
            color: isDark ? null : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          AddNewPropertyInfoField(
            controller: addNewPropertyController.address1Controller,
            label: 'Address Line1*',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: addNewPropertyController.address2Controller,
            label: 'Address Line2',
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: addNewPropertyController.cityController,
            label: 'City*',
          ),
          SizedBox(height: 20.h),
          CustomDropdownMenu(
            alignmentGeometry: Alignment(0.2, 1),
            onSelect: (value) {
              addNewPropertyController.selectedState.value = value!;
            },
            option: addNewPropertyController.stateType,
            isSelect: addNewPropertyController.selectedState,
            label: CustomTextSecondary(text: 'State*'),
          ),
          SizedBox(height: 20.h),
          AddNewPropertyInfoField(
            controller: addNewPropertyController.zipController,
            label: 'Zip Code*',
          ),
        ],
      ),
    );
  }
}
