import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_filter.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_type.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class InspectionRequestView extends StatelessWidget {
  const InspectionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(colors: [AppColors.darkPrimary, AppColors.darkPrimary])
          : AppColors.userBackground.withOpacity(0.5),
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Inspection Request'),
          SizedBox(height: 24.h),
          InspectionType(),
          SizedBox(height: 12.h),
          InspectionFilter(),
          SizedBox(height: 20.h,),
          InspectionTable(),
        ],  
      ),
    );
  }
}
