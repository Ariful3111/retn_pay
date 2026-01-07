import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/services_controller.dart';
import 'package:renter_pay/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';

class ServiceDropdownMenu extends StatelessWidget {
  const ServiceDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController servicesController = Get.find();
    return SizedBox(
      height: 38.h,
      width: 170.w,
      child: Center(
        child: CustomDropdownMenu(
          offset: Offset(1, 2),
          onSelect: (value) {
            servicesController.selectedServiceType.value = value!;
            servicesController.isSelected.value = true;
          },
          option: servicesController.serviceType,
          isSelect: servicesController.selectedServiceType,
          borderWidth: 1.r,
          focusBorderWidth: 1.r,
          borderRadius: 6.r,
          focusBorderRadius: 6.r,
          expandedInsets: EdgeInsets.zero,
          textAlign: TextAlign.left,
          contentPadding: EdgeInsets.only(left: 8.w),
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
