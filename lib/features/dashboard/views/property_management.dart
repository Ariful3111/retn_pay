import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/views/add_new_property.dart';
import 'package:renter_pay/features/dashboard/views/property_management_details.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/drawer_items_appbar.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_row.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_table.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_type.dart';
import 'package:renter_pay/features/dashboard/widgets/property_owner_document_widgets/property_owner_document.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class PropertyManagement extends StatelessWidget {
  const PropertyManagement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewPropertyController addNewPropertyController = Get.find();
    PropertyManagementController propertyManagementController = Get.find();
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
          Obx(
            () =>addNewPropertyController.isPropertyDetails.value?PropertyManagementDetails() :addNewPropertyController.isNewProperty.value
                ? PropertyOwnerDocument()
                : Column(
                    children: [
                      SizedBox(height: 16.h),
                      PropertyManagementRow(),
                      SizedBox(height: 20.h),
                      propertyManagementController.isViewProperty.value
                          ? AddNewProperty()
                          : PropertyManagementTable(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
