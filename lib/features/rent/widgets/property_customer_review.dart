import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/rent/controllers/property_review_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/customer_review.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class PropertyCustomerReview extends GetView<PropertyReviewController> {
  const PropertyCustomerReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : controller.propertyReviews.value!.data!.reviews!.isEmpty
          ? SizedBox()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextPrimary(
                  text: 'Customer Review',
                  fontSize: 20.sp,
                  color: isDark ? AppColors.darkAppBar : Color(0xFF251621),
                ),
                CustomTextPrimary(
                  text:
                      'Hear what our happy tenants say about ${Get.find<PropertyViewController>().propertyDetails.value!.data!.name}',
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.darkLightText,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                CustomerReview(
                  linearGradient: LinearGradient(
                    colors: [AppColors.darkSecondary, AppColors.darkSecondary],
                  ),
                ),
              ],
            );
    });
  }
}
