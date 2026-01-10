import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/shared/widgets/custom_drawer/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final Alignment? alignment;
  const CustomDrawer({super.key, this.alignment});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    DashboardController dashboardController = Get.find();
    int userIndex = 2;
    double drawerHeight;
    double drawerWidth;
    if (userIndex == 1) {
      drawerHeight = 560.h;
      drawerWidth = 277.w;
    }
    if(userIndex==2){
      drawerHeight = 500.h;
      drawerWidth = 277.w;
    }else{
      drawerHeight = 460.h;
      drawerWidth = 260.w;
    }
    return Align(
      alignment: alignment ?? Alignment(-0.8, -0.7),
      child: Container(
        padding: EdgeInsets.only(
          top: 24.h,
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        height: drawerHeight,
        width: drawerWidth,
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
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
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
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        IconsPath.drawerClose,
                        height: 24.h,
                        width: 24.w,
                        color: isDark ? AppColors.darkAppBar : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                ...List.generate(dashboardController.userDrawerItems.length, (
                  index,
                ) {
                  return CustomDrawerItem(index: index);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
