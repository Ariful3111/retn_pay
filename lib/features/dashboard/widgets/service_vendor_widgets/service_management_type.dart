import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceManagementType extends StatelessWidget {
  const ServiceManagementType({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceManagementController serviceManagementController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.63.r),
          gradient: isDark
              ? AppColors.darkAppIcon
              : LinearGradient(
                  colors: [AppColors.whiteColor, AppColors.whiteColor],
                ),
        ),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              serviceManagementController.serviceType.length,
              (index) {
                final isSelected =
                    serviceManagementController.serviceTypeIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    serviceManagementController.serviceTypeIndex.value = index;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.42.r),
                      color: isSelected ? AppColors.primaryColorDark : null,
                    ),
                    child: CustomTextSecondary(
                      text: serviceManagementController.serviceType[index],
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColors.whiteColor
                          : isDark
                          ? AppColors.darkPrimary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
