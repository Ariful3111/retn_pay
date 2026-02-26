import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_conditional_report.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_row.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table.dart';
import 'package:renter_pay/shared/widgets/custom_animation/custom_table_animation.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class PropertyManagement extends StatelessWidget {
  const PropertyManagement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    PropertyManagementController propertyManagementController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.all(20.h),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        controller: propertyManagementController.propertyScrollController,
        children: [
          PropertyManagementAppbar(),
          Obx(() {
            bool isProperty =
                propertyManagementController.selected.value == 'Property';
            Widget child;
            if (!isProperty) {
              child = Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    if (userIndex == 2) PropertyManagementRow(),
                    if (userIndex == 2) SizedBox(height: 20.h),
                    PropertyConditionalReport(),
                  ],
                ),
              );
            } else {
              child = Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16.h),
                      PropertyManagementRow(),
                      SizedBox(height: 20.h),
                      PropertyManagementTable(),
                    ],
                  ),
                ],
              );
            }
            return CustomTableAnimation(child: child);
          }),
        ],
      ),
    );
  }
}
