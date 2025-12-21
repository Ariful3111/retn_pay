import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_booked_details_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/submit_rating_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';

class ServiceBookedComplete extends StatelessWidget {
  const ServiceBookedComplete({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceBookedDetailsController serviceBookedDetailsController = Get.find();
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
                rating: CustomRatingBuilder(
                  onRating: (value) {
                    serviceBookedDetailsController.rating.value = value;
                  },
                  initialRating: serviceBookedDetailsController.rating.value,
                ),
                ratingTitle: 'Rate the Service Provider',
                onTap: () {},
                writeReview: true,
                controller: serviceBookedDetailsController.reviewController,
                cancelButton: CustomSecondaryButton(
                      text: 'Cancel',
                      height: 40.h,
                      width: 85.w,
                      borderRadius: BorderRadius.circular(6.r),
                      onPressed: () {
                      
                    },),
                    buttonSpace: SizedBox(width: 16.w,),
              );
            },
          );
        },
      ),
    );
  }
}
