import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_maintenance_table.dart';
import 'package:renter_pay/features/dashboard/widgets/repair_maintenance_widgets/repair_types.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class RepairMaintenanceView extends StatelessWidget {
  const RepairMaintenanceView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
      gradient:isDark?LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary]):AppColors.userBackground,
      child: ListView(
      children: [
        DrawerItemsAppbar(title: 'Repairs & Maintenance'),
        SizedBox(height: 24.h,),
        RepairTypes(),
        SizedBox(height: 20.h,),
        RepairMaintenanceTable(),
      ],
    ));
  }
}