import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_image.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/view_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_widgets.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_widgets/property_management_appbar.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';

class PropertyManagementDetails extends StatelessWidget {
  const PropertyManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            PropertyManagementAppbar(),
            SizedBox(height: 20.h),
            ActivePropertyImage(),
            SizedBox(height: 20.h),
            PropertyDetailsInfo(propertyDetails: PropertyDetailsModel()),
            SizedBox(height: 20.h),
            ViewNotice(),
            SizedBox(height: 20.h),
            PropertyManagementDetailsWidgets(),
            SizedBox(height: 24.h),
            CustomPrimaryButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addNewProperty);
              },
              height: 52.h,
              width: 163.w,
              text: 'Edit Property',
              borderRadius: BorderRadius.circular(8.r),
            ),
          ],
        ),
      ),
    );
  }
}
