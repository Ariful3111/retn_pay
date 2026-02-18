import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/submit_property_review_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/active_property_widgets/active_property_rating.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class ActivePropertyReview extends GetWidget<SubmitPropertyReviewController> {
  final int propertyID;
  const ActivePropertyReview({super.key, required this.propertyID});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        spanText(title: 'Review'),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.24.r,
              color: isDark
                  ? AppColors.darkBorderPrimary
                  : AppColors.secondaryBorder,
            ),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1.24),
                blurRadius: 2.48,
                color: AppColors.dropShadowColorSecondary.withValues(
                  alpha: 0.24,
                ),
              ),
            ],
          ),
          child: CustomTextField(
            controller: controller.reviewController,
            maxLines: 5,
            labelText: 'Enter Your Review',
            isAlignLabelWithHint: true,
            fillColor: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          ),
        ),
        SizedBox(height: 15.h),
        spanText(title: 'Give a rating'),
        SizedBox(height: 8.h),
        ActivePropertyRating(propertyID: propertyID),
      ],
    );
  }

  Widget spanText({required String title}) {
    return CustomTextSpan(
      title: title,
      spantext: "*",
      fontSize: 16.sp,
      spanFontSize: 17.33.sp,
      fontWeight: FontWeight.w400,
      spanColor: AppColors.primaryColorDark,
    );
  }
}
