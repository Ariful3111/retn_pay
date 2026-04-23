import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_book_info.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_image.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceBookedRequest extends StatelessWidget with ServiceBookInfo {
  final BookingItem? bookingItem;
  const ServiceBookedRequest({super.key, this.bookingItem});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final user = bookingItem?.user;
    final property = bookingItem?.property;

    return ServiceDetailsContainer(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomTextPrimary(
              text: 'Service Request Details',
              fontSize: 22.w,
            ),
          ),
          SizedBox(height: 24.h),
          // User Info
          myInfo(
            title: 'Resident First Name:',
            data: _getFirstName(user?.name),
          ),
          myInfo(title: 'Resident Last Name:', data: _getLastName(user?.name)),
          myInfo(title: 'Resident Email:', data: user?.email ?? 'Not provided'),
          myInfo(title: 'Resident Phone Number:', data: 'Not provided'),
          SizedBox(height: 4.h),
          CustomTextSecondary(
            text: 'Property Address:',
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          myInfo(
            title: 'Address Line 1:',
            data: property?.address ?? 'Not specified',
          ),
          myInfo(title: 'City', data: property?.city ?? '-'),
          myInfo(title: 'State', data: property?.state ?? '-'),
          myInfo(title: 'Zip Code', data: property?.postalCode ?? '-'),
          SizedBox(height: 4.h),
          ServiceBookedImage(bookingItem: bookingItem),
        ],
      ),
    );
  }

  String _getFirstName(String? fullName) {
    if (fullName == null || fullName.isEmpty) return '-';
    final parts = fullName.split(' ');
    return parts.isNotEmpty ? parts.first : '-';
  }

  String _getLastName(String? fullName) {
    if (fullName == null || fullName.isEmpty) return '-';
    final parts = fullName.split(' ');
    return parts.length > 1 ? parts.sublist(1).join(' ') : '-';
  }
}
