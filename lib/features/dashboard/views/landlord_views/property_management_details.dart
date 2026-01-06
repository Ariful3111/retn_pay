import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_image.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/view_notice.dart';
import 'package:renter_pay/features/dashboard/widgets/property_management_details_widgets/property_management_details_widgets.dart';
import 'package:renter_pay/shared/widgets/property/property_details_info.dart';

class PropertyManagementDetails extends StatelessWidget {
  const PropertyManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        ActivePropertyImage(),
        SizedBox(height: 20.h),
        PropertyDetailsInfo(),
        SizedBox(height: 20.h),
        ViewNotice(),
        SizedBox(height: 20.h),
        PropertyManagementDetailsWidgets()
      ],
    );
  }
}
