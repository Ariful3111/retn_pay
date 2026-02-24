import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/repair_maintenance_details_model.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class RepairRequestInfo extends StatelessWidget {
  final RepairMaintenanceDetailsData? data;
  const RepairRequestInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final property = data?.property;
    final propertyName = (property?.title?.trim().isNotEmpty ?? false)
        ? property?.title
        : property?.name;
    final date = (data?.preferredDate).toDMMMyyyy();
    final time = (data?.preferredTimeSlots != null &&
            (data?.preferredTimeSlots?.isNotEmpty ?? false))
        ? data?.preferredTimeSlots?.first
        : (data?.preferredTimeOther ?? '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextPrimary(text: propertyName ?? '', fontSize: 24.sp),
        SizedBox(height: 12.h),
        CustomTextSecondary(
          text: property?.address ?? '',
          color: AppColors.darkLightText,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dateTime(
              title: 'Date:',
              subTitle: date,
            ),
            dateTime(
              title: 'Time:',
              subTitle: time ?? '',
            ),
          ],
        ),
      ],
    );
  }

  Widget dateTime({required String title, required String subTitle}) {
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
