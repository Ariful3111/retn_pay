import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/update_booking_status_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/submit_rating_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';

class ServiceBookedComplete extends StatelessWidget {
  final BookingItem bookingItem;
  const ServiceBookedComplete({super.key, required this.bookingItem});

  @override
  Widget build(BuildContext context) {
    ServiceBookedDetailsController serviceBookedDetailsController = Get.find();
    UpdateServiceStatusController updateServiceStatusController = Get.find();
    return Center(
      child: CustomPrimaryButton(
        height: 40.h,
        width: 170.w,
        borderRadius: BorderRadius.circular(6.r),
        text: 'Mark as Complete',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SubmitRatingDialog(
                height: 320.h,
                fieldHeight: 125.h,
                maxLines: 5,
                isAlignLabelWithHint: true,
                rating: CustomRatingBuilder(
                  itemSize: 20.sp,
                  onRating: (value) {
                    serviceBookedDetailsController.rating.value = value;
                  },
                  initialRating: serviceBookedDetailsController.rating.value,
                ),
                ratingTitle: 'Rate the Service Provider',
                onTap: () async {
                  Navigator.pop(context);
                  await updateServiceStatusController.updateBookingStatus(
                    serviceID: bookingItem.id ?? 0,
                    status: 'completed',
                    adminNotes:
                        serviceBookedDetailsController.reviewController.text,
                  );
                },
                writeReview: true,
                controller: serviceBookedDetailsController.reviewController,
                cancelButton: CustomSecondaryButton(
                  text: 'Cancel',
                  height: 40.h,
                  width: 85.w,
                  borderRadius: BorderRadius.circular(6.r),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                buttonSpace: SizedBox(width: 16.w),
              );
            },
          );
        },
      ),
    );
  }
}
