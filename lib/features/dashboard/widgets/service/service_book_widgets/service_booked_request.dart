import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_book_info.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_image.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceBookedRequest extends StatelessWidget with ServiceBookInfo {
  const ServiceBookedRequest({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
          myInfo(title: 'Resident First Name:', data: 'Ariful'),
          myInfo(title: 'Resident Last Name:', data: 'Islam'),
          myInfo(title: 'Resident Email:', data: 'arif@gmail.com'),
          myInfo(title: 'Resident Phone Number:', data: '016564154'),
          SizedBox(height: 4.h),
          CustomTextSecondary(
            text: 'Property Address:',
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          myInfo(title: 'Address Line 1:', data: 'Dahaka'),
          myInfo(title: 'Address Line 2:', data: 'Dhaka'),
          myInfo(title: 'City', data: 'Dhaka'),
          myInfo(title: 'State', data: 'Dhaka'),
          myInfo(title: 'Zip Code', data: '265'),
          SizedBox(height: 4.h),
          ServiceBookedImage(),
        ],
      ),
    );
  }
}
