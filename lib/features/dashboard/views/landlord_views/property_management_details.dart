import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_image.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/view_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_widgets.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';

class PropertyManagementDetails extends StatelessWidget {
  const PropertyManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPropertyController addNewPropertyController = Get.find();
    return Column(
      children: [
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
            addNewPropertyController.isNewProperty.value = true;
          },
          height: 52.h,
          width: 163.w,
          text: 'Edit Property',
          borderRadius: BorderRadius.circular(8.r),
        ),
      ],
    );
  }
}
