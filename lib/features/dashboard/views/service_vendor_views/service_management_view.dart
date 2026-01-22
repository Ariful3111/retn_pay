import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/service_management_table.dart';
import 'package:renter_pay/features/dashboard/widgets/service_vendor_widgets/service_management_type.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ServiceManagementView extends StatelessWidget {
  const ServiceManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark ? null : AppColors.userBackground,
      child: ListView(children: [
         DrawerItemsAppbar(title: 'Service Management'),
         SizedBox(height: 24.h,),
         ServiceManagementType(),
         SizedBox(height: 24.h,),
         ServiceManagementTable()
      ]),
    );
  }
}
