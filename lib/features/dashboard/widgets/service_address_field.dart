import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service_from_field.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown_menu.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceAddressField extends StatelessWidget with ServiceFromField {
  const ServiceAddressField({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CustomTextSecondary(
            text: 'Property Address:',
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          myField(
            controller: serviceSearchController.address1Controller,
            context: context,
            labelText:myLabel(title: 'Address Line 1', spanText: '*') ,
          ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.address2Controller,
            context: context,
            labelText:myLabel(title: 'Address Line 2', spanText: '') ,
          ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.cityController,
            context: context,
            labelText:myLabel(title: 'City', spanText: '*') ,
          ),
          SizedBox(height: 20.h),
           CustomDropdownMenu(
              onSelect: (value) {
                serviceSearchController.state.value = value!;
              },
              option: serviceSearchController.stateList,
              isSelect: serviceSearchController.state,
              textAlign: TextAlign.left,
              borderWidth: 1.r,
              borderRadius: 12.r,
              focusBorderRadius: 12.r,
              focusBorderWidth: 1.r,
              label:myLabel(title: 'State', spanText: '*'),
            ),
          SizedBox(height: 20.h),
          myField(
            controller: serviceSearchController.zipController,
            context: context,
            labelText:myLabel(title:'Zip Code', spanText: '*') ,
          ),],);
  }
}