import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Container(
      height: 78.44.h,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(17.43.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextPrimary(
            text: 'Quick Actions',
            fontSize: 24.sp,
            color: AppColors.primaryColorDark,
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                dashboardController.isQuickActions.value =
                    !dashboardController.isQuickActions.value;
              },
              child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Center(
                  child: Image.asset(
                    dashboardController.isQuickActions.value
                        ? IconsPath.upArrow
                        : IconsPath.downArrow,
                    height: 7.5.h,
                    width: 15.w,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
