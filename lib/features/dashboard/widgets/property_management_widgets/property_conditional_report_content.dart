import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_filter_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class PropertyConditionalReportContent extends StatelessWidget {
  final int rowIndex;
  const PropertyConditionalReportContent({super.key, required this.rowIndex});

  @override
  Widget build(BuildContext context) {
    PropertyManagementController propertyManagementController = Get.find();
    final item = propertyManagementController.allRows[rowIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: "Agent Name: ${item.agent}"),
        SizedBox(height: 8.h),
        infoText(title: "Agent Email: ${item.email}"),
        SizedBox(height: 8.h),
        infoText(title: "Agent Phone No: ${item.phoneNo}"),
        SizedBox(height: 8.h),
        CustomTextSecondary(
          text: 'Date: ${item.date}',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 8.h),
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
