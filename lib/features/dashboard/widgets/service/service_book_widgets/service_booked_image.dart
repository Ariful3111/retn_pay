import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_book_info.dart';
import 'package:renter_pay/shared/widgets/custom_attach_image/custom_attach_image_view.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceBookedImage extends StatelessWidget with ServiceBookInfo {
  final BookingItem? bookingItem;
  const ServiceBookedImage({super.key, this.bookingItem});

  @override
  Widget build(BuildContext context) {
    ServiceBookedDetailsController serviceBookedDetailsController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSecondary(
          text: 'Service Request Details:',
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        myInfo(
          title: 'Location of Problem:',
          data: bookingItem?.property?.address ?? 'Not specified',
        ),
        myInfo(
          title: 'Problem Details:',
          data: bookingItem?.service?.description ?? 'No details provided',
        ),
        CustomTextSecondary(text: 'Attached Photos'),
        SizedBox(height: 4.h),
        Row(
          children: [
            CustomAttachImageView(
              height: 108.h,
              width: 108.w,
              padding: 8.w,
              radius: 10.r,
              sizeHeight: 108.h,
              imageList: serviceBookedDetailsController.imageList,
            ),
          ],
        ),
        SizedBox(height: 24.h),
        CustomTextSecondary(
          text: 'Preferred Time of Service',
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.only(top: 24.h, left: 24.w, bottom: 24.h),
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSecondary(
                text: 'Availability 1',
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(height: 12.h),
              myInfo(
                title: 'Date',
                data: bookingItem?.scheduledAt ?? 'Not scheduled',
              ),
              myInfo(title: 'Preferred Time Period:', data: 'To be confirmed'),
            ],
          ),
        ),
      ],
    );
  }
}
