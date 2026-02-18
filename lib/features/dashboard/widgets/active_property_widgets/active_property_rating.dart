import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/submit_property_review_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_dialog/submit_rating_dialog.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_builder.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ActivePropertyRating extends GetWidget<SubmitPropertyReviewController> {
  final int propertyID;
  const ActivePropertyRating({super.key, required this.propertyID});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          width: MediaQuery.widthOf(context),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
            border: Border.all(
              width: 1.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.secondaryBorder,
            ),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                color: AppColors.dropShadowColorSecondary.withValues(
                  alpha: 0.24,
                ),
              ),
            ],
          ),
          child: CustomRatingBuilder(
            onRating: (value) {
              controller.rating.value = value;
            },
            initialRating: controller.rating.value,
            itemSize: 24.w,
            itemBuilder: (_, _) {
              return Image.asset(IconsPath.star);
            },
          ),
        ),
        SizedBox(height: 30.h),
        Obx(() {
          return controller.isLoading.value
              ? ButtonLoading()
              : CustomPrimaryButton(
                  height: 52,
                  text: 'Submit Review',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SubmitRatingDialog(
                          rating: CustomRatingBar(
                            rating: controller.rating.value,
                          ),
                          ratingTitle: 'Rate The Landlord',
                          reviewText: controller.reviewController.text,
                          onTap: () async {
                            Get.back();
                            await controller.submitReview(
                              propertyID: propertyID,
                            );
                          },
                          writeReview: false,
                        );
                      },
                    );
                  },
                );
        }),
      ],
    );
  }
}
