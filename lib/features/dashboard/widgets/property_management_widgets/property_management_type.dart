import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown_menu.dart';

class PropertyManagementType extends StatelessWidget {
  const PropertyManagementType({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    return SizedBox(
      height: 38.h,
      width: 136.w,
      child: CustomDropdownMenu(
        expandedInsets: EdgeInsets.zero,
        onSelect: (value) {
          propertyManagementController.selected.value = value!;
        },
        option: propertyManagementController.manageType,
        isSelect: propertyManagementController.selected,
        textAlign: TextAlign.left,
        borderWidth: 1.r,
        focusBorderWidth: 1.r,
        borderRadius: 6.r,
        focusBorderRadius: 6.r,
        contentPadding: EdgeInsets.zero,
        fontSize: 12.sp,
        menuFontSize: 12.sp,
        selectedTrailingIconColor: AppColors.secondaryTextColor,
        trailingIconColor:AppColors.secondaryTextColor ,
      ),
    );
  }
}
