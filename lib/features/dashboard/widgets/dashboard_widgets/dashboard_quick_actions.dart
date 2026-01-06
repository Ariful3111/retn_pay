import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    return Container(
      height: 78.44.h,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(17.43.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextPrimary(
            text: 'Quick Actions',
            fontSize: 24.sp,
            color: isDark ? AppColors.darkAppBar : AppColors.primaryColorDark,
          ),
          Obx(
            () => InkWell(
              onTap: () {
                
                dashboardController.isQuickActions.value =
                    !dashboardController.isQuickActions.value;
              },
              child: Padding(
                padding:  EdgeInsets.all(8.r),
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
