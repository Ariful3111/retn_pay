import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/booking_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class BookingManagementTableContent extends StatelessWidget {
  final BookingItem bookingItem;
  const BookingManagementTableContent({super.key, required this.bookingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoText(title: 'Client Name: ${bookingItem.user?.name ?? '-'}'),
        SizedBox(height: 8.h),
        infoText(
          title: 'Address: ${bookingItem.property?.address ?? 'Not specified'}',
        ),
        SizedBox(height: 8.h),
        infoText(
          title: 'Schedule: ${bookingItem.scheduledAt ?? 'Not scheduled yet'}',
        ),
        SizedBox(height: 8.h),
        infoText(
          title:
              'Vendor: ${bookingItem.vendor?.businessName ?? 'Not assigned'}',
        ),
      ],
    );
  }

  infoText({required String title}) {
    return CustomTextPrimary(
      text: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
