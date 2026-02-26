import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/agent_widgets/property_management_reassignment.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyManagementTableContent extends StatelessWidget {
  final Property property;
  const PropertyManagementTableContent({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    bool isProperty = propertyManagementController.selected.value == 'Property';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isProperty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userIndex == 2
                  ? Row(
                      children: [
                        infoText(title: 'Reassignment Request:'),
                        SizedBox(width: 4.w),
                        PropertyManagementReassignment(),
                      ],
                    )
                  : Row(
                      children: [
                        infoText(title: 'Verification Status:'),
                        SizedBox(width: 4.w),
                        TableStatus(status: property.status.toString()),
                      ],
                    ),
              SizedBox(height: 8.h),
              userIndex == 2
                  ? infoText(title: 'Assigned By: Landlord')
                  : infoText(
                      title:
                          "Monthly Rent: ${property.units?.first.rentAmount ?? 'N/A'}",
                    ),
              SizedBox(height: 8.h),
            ],
          ),
        userIndex == 2 && isProperty
            ? infoText(
                title: "Landlord Name: ${property.landlord?.name ?? 'N/A'}",
              )
            : infoText(title: "Agent Name: ${property.agent?.name ?? 'N/A'}"),
        SizedBox(height: 8.h),
        userIndex == 2 && isProperty
            ? infoText(
                title: "Landlord Email: ${property.landlord?.email ?? 'N/A'}",
              )
            : infoText(title: "Agent Email: ${property.agent?.email ?? 'N/A'}"),
        SizedBox(height: 8.h),
        userIndex == 2 && isProperty
            ? infoText(
                title:
                    "Landlord Phone No: ${property.landlord?.phone ?? 'N/A'}",
              )
            : infoText(
                title: "Agent Phone No: ${property.agent?.phone ?? 'N/A'}",
              ),
        if (userIndex == 2 && isProperty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              infoText(title: "Tenant Name: ${'N/A'}"),
              SizedBox(height: 8.h),
              infoText(title: "Tenant Email: ${'N/A'}"),
              SizedBox(height: 8.h),
              infoText(title: "Tenant Phone No: ${'N/A'}"),
            ],
          ),
        SizedBox(height: 8.h),
        if (isProperty)
          if (property.status == 'approved' && userIndex == 1) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                infoText(title: "Enlisting Status:"),
                SizedBox(width: 6.w),
                TableStatus(status: property.status.toString()),
              ],
            ),
          ],
      ],
    );
  }

  infoText({required String title, FontWeight? fontWeight}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
