import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/drawer_item.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    return Align(
      alignment: Alignment(-0.8, -0.7),
      child: Container(
        padding: EdgeInsets.only(
          top: 24.h,
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        height: 460.h,
        width: 260.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 30,
              color: AppColors.darkPrimary.withValues(alpha: 0.20),
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
        ),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  IconsPath.drawerLogo,
                  height: 19.11.h,
                  width: 115.52.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    IconsPath.drawerClose,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.w),
            ...List.generate(dashboardController.drawerItems.length, (index) {
              return DrawerItem(index: index);
            }),
          ],
        ),
      ),
    );
  }
}
