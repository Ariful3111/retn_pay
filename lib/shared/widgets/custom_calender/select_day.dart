import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class SelectDay extends StatelessWidget {
  const SelectDay({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List dateList = [
      'Today',
      'Yesterday',
      'Last 7 Days',
      'Last 30 Days',
      'This Month',
      'This Year',
      'Custom Range',
    ];
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 7.08.h, horizontal: 9.44.w),
        width: 89.11.w,
        height: 164.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.08.r),
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          border: Border.all(
            width: 0.69.r,
            color: isDark
                ? AppColors.darkBorderPrimary
                : AppColors.whiteLightBorder,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4.72),
              blurRadius: 16.52,
              color: AppColors.dropShadowColor.withValues(alpha: 0.10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(dateList.length, (index) {
            final selected = dashboardController.isDay.value == index;
            return GestureDetector(
              onTap: () {
                dashboardController.isDay.value = index;
              },
              child: Container(
                height: 18.72.h,
                width: 70.32.w,
                margin: EdgeInsets.only(bottom: index == 6 ? 0 : 2.36.h),
                padding: EdgeInsets.symmetric(
                  vertical: 2.36.h,
                  horizontal: 4.72.w,
                ),
                decoration: BoxDecoration(
                  gradient: selected?AppColors.primaryColor:null,
                  borderRadius: BorderRadius.circular(selected?4.72.r:0.r),
                ),
                child: CustomTextSecondary(
                  text: dateList[index],
                  fontSize: 9.44.sp,
                  color:selected? AppColors.whiteColor:isDark
                      ? AppColors.darkAppBar
                      : AppColors.darkContainer,
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
