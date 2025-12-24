import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_row.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_type.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class PropertyManagement extends StatelessWidget {
  const PropertyManagement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.h),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerItemsAppbar(title: 'Property Management'),
              PropertyManagementType(),
            ],
          ),
          SizedBox(height: 16.h,),
          PropertyManagementRow(),
          SizedBox(height: 20.h,),
          PropertyManagementTable()
        ],
      ),
    );
  }
}
