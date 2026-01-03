import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_table/table_status.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyManagementTableContent extends StatelessWidget {
  final int rowIndex;
  const PropertyManagementTableContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    bool isProperty = propertyManagementController.selected.value == 'Property';
    final item = propertyManagementController.allRows[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      if(isProperty)  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                infoText(title: 'Verification Status:'),
                SizedBox(width: 4.w),
                TableStatus(status: item.verifyStatus),
              ],
            ),
            SizedBox(height: 8.h),
            infoText(title: "Monthly Rent: ${item.rent}"),
            SizedBox(height: 8.h),
          ],
        ),

        infoText(title: "Agent: ${item.agent}"),
        SizedBox(height: 8.h),
        infoText(title: "Agent: ${item.email}"),
        SizedBox(height: 8.h),
        infoText(title: "Agent: ${item.phoneNo}"),
        SizedBox(height: 8.h),
        if (!isProperty)
          CustomTextSecondary(
            text: 'Date: 8 Aug, 2025',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        if (!isProperty) SizedBox(height: 8.h),
        if (isProperty)
          if (item.verifyStatus == 'Approved') ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                infoText(title: "Enlisting Status:"),
                SizedBox(width: 6.w),
                TableStatus(status: item.enlistStatus),
              ],
            ),
          ],
        if (!isProperty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoText(title: 'Condition Report', fontWeight: FontWeight.w500),
              SizedBox(height: 6.w),
              CustomFilterAppbar(
                width: 100.w,
                height: 34.h,
                title: 'Download',
                icon: IconsPath.export,
                onTap: () {},
              ),
            ],
          ),
        SizedBox(height: 16.h),
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
