import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_table.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/inspection_type.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_search.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_table.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class InspectionRequestView extends GetView<InspectionRequestController> {
  const InspectionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: ListView(
        children: [
          DrawerItemsAppbar(title: 'Inspection Request'),
          SizedBox(height: 24.h),
          InspectionType(),
          SizedBox(height: 12.h),
          if (userIndex == 1 || userIndex == 2) LandlordInspectionSearch(),
          SizedBox(height: 20.h),
          Obx(() {
            return controller.isLoading.value
                ? ButtonLoading()
                : Column(
                    children: [
                      if (userIndex == 0) InspectionTable(),
                      if (userIndex == 1 || userIndex == 2)
                        LandlordInspectionTable(),
                      SizedBox(height: 20.h),
                    ],
                  );
          }),

          //  if(userIndex==0) InspectionFilter(),
        ],
      ),
    );
  }
}
