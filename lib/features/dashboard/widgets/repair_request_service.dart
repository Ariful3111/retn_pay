import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_request_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/submit_rating_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class RepairRequestService extends StatelessWidget {
  const RepairRequestService({super.key});

  @override
  Widget build(BuildContext context) {
    RepairRequestController repairRequestController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSpan(
          title: 'Assigned To: ',
          spantext: 'Michael Lee (Plumber, PrimeFix Services)',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          spanFontSize: 20.sp,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
        ),
        SizedBox(height: 8.h),
        CustomTextSpan(
          title: 'Contact: ',
          spantext: '+1 555-987-6543',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          spanFontSize: 20.sp,
          spanColor: isDark ? AppColors.whiteColor : AppColors.darkPrimary,
        ),
        SizedBox(height: 24.h),
        CustomPrimaryButton(
          height: 40.h,
          width: 169.w,
          borderRadius: BorderRadius.circular(6.r),
          text: 'Mark as Complete',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SubmitRatingDialog(
                  rating: CustomRatingBuilder(
                    onRating: (value) {
                      repairRequestController.rating.value = value;
                    },
                    initialRating: repairRequestController.rating.value,
                  ),
                  ratingTitle: 'Rate The Service Provider',
                  onTap: () {},
                  writeReview: true,
                  controller: repairRequestController.reviewController,
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
      ],
    );
  }
}
