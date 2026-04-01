import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/inspection_request_widgets/landlord_inspection/landlord_inspection_view_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class LandlordInspectionViewDetails
    extends GetWidget<InspectionDetailsController> {
  const LandlordInspectionViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.inspectionDetails.value?.data;
    final tenant = data?.tenant;
    final property = data?.property;

    // Parse inspection date
    String scheduleDate = 'N/A';
    String scheduleTime = 'N/A';
    if (data?.inspectionDate != null) {
      try {
        final dateTime = DateTime.parse(data!.inspectionDate!);
        scheduleDate = DateFormat('d MMM, yyyy').format(dateTime);
        scheduleTime = DateFormat('hh:mm a').format(dateTime);
      } catch (e) {
        scheduleDate = data!.inspectionDate ?? 'N/A';
      }
    }

    // Format inspection type
    String formatInspectionType(String? type) {
      if (type == null) return 'N/A';
      switch (type.toLowerCase()) {
        case 'in_person':
          return 'In-Person';
        case 'virtual':
          return 'Virtual';
        default:
          return type;
      }
    }

    return LandlordInspectionViewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Personal Details',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12.h),
          formText(title: 'Full Name:', subTitle: tenant?.name ?? 'N/A'),
          SizedBox(height: 12.h),
          formText(title: 'Email Address:', subTitle: tenant?.email ?? 'N/A'),
          SizedBox(height: 12.h),
          formText(title: 'Phone:', subTitle: tenant?.phone ?? 'N/A'),
          SizedBox(height: 12.h),
          formText(title: 'Property Name:', subTitle: property?.title ?? 'N/A'),
          SizedBox(height: 12.h),
          formText(
            title: 'Property Address:',
            subTitle: property?.address ?? 'N/A',
          ),
          SizedBox(height: 12.h),
          formText(title: 'Schedule Date:', subTitle: scheduleDate),
          SizedBox(height: 12.h),
          formText(title: 'Schedule Time:', subTitle: scheduleTime),
          SizedBox(height: 12.h),
          formText(
            title: 'Inspection Type:',
            subTitle: formatInspectionType(data?.type),
          ),
        ],
      ),
    );
  }

  Widget formText({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(text: title, color: AppColors.darkLightText),
        SizedBox(height: 4.h),
        CustomTextPrimary(
          text: subTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
