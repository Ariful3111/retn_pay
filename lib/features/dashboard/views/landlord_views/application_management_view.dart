import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/application_management_widgets/application_management_table.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ApplicationManagementView extends StatelessWidget {
  const ApplicationManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark ? null : AppColors.userBackground,
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Application Management'),
          SizedBox(height: 24.h),
          ApplicationManagementTable(),
        ],
      ),
    );
  }
}
