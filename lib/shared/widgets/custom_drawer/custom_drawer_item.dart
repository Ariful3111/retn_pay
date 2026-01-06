import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class CustomDrawerItem extends StatelessWidget {
  final int index;
  const CustomDrawerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final DashboardController dashboardController = Get.find();
    return Obx(() {
      final item = dashboardController.userDrawerItems[index];
      final isSelected = dashboardController.isItemSelect.value == index;
      return GestureDetector(
        onTap: () {
          dashboardController.isItemSelect.value = index;
          Navigator.pop(context);
          final route = item['routes'];
          if (Get.currentRoute != route) {
            Get.toNamed(route);
          }
        },
        child: Container(
          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.only(bottom: 12.h),
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Image.asset(
                item['icon'],
                height: 24.h,
                width: 24.w,
                color: isSelected
                    ? AppColors.whiteColor
                    : isDark
                    ? AppColors.darkSecondaryText
                    : Color(0xFF3B0225),
              ),
              SizedBox(width: 8.w),
              CustomTextSecondary(
                text: item['title'],
                color: isSelected
                    ? AppColors.whiteColor
                    : isDark
                    ? AppColors.darkSecondaryText
                    : Color(0xFF3B0225),
              ),
            ],
          ),
        ),
      );
    });
  }
}
