import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_book_widgets/service_booked_request.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class BookingManagementDetails
    extends GetView<BookingManagementDetailsController> {
  const BookingManagementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.r),
      gradient: isDark ? null : AppColors.userBackground,
      child: Obx(() {
        final booking = controller.booking;
        if (booking == null) {
          return const Center(child: ButtonLoading());
        }
        return ListView(
          children: [
            Row(
              children: [
                CustomAppbarLeading(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 8.w),
                CustomAppbar(title: 'Booking Details'),
              ],
            ),
            SizedBox(height: 32.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  // Service Image
                  booking.service?.bannerImage != null
                      ? Image.network(
                          booking.service!.bannerImage!,
                          height: 211.h,
                          width: MediaQuery.widthOf(context),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                ImagesPath.service,
                                height: 211.h,
                                width: MediaQuery.widthOf(context),
                              ),
                        )
                      : Image.asset(
                          ImagesPath.service,
                          height: 211.h,
                          width: MediaQuery.widthOf(context),
                        ),
                  SizedBox(height: 12.h),
                  // Service Info
                  Row(
                    children: [
                      booking.service?.logo != null
                          ? Image.network(
                              booking.service!.logo!,
                              height: 33.83.h,
                              width: 33.83.w,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                    IconsPath.service,
                                    height: 33.83.h,
                                    width: 33.83.w,
                                  ),
                            )
                          : Image.asset(
                              IconsPath.service,
                              height: 33.83.h,
                              width: 33.83.w,
                            ),
                      SizedBox(width: 9.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextPrimary(
                              text: booking.service?.title ?? 'Service',
                              fontSize: 20.sp,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkContainer,
                            ),
                            SizedBox(height: 4.h),
                            CustomTextSecondary(
                              text: booking.service?.subtext ?? '',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Booking Request Details
                  ServiceBookedRequest(bookingItem: booking),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPrimaryButton(
                  onPressed: () {},
                  height: 40.h,
                  width: 100.w,
                  text: 'Accept',
                  borderRadius: BorderRadius.circular(6.r),
                ),
                SizedBox(width: 12.w),
                CustomSecondaryButton(
                  onPressed: () {},
                  height: 40.h,
                  width: 100.w,
                  text: 'Reject',
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
