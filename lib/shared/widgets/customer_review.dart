import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/rent/controllers/property_review_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class CustomerReview extends GetView<PropertyReviewController> {
  final LinearGradient? linearGradient;
  const CustomerReview({super.key, this.linearGradient});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      if (controller.isLoading.value) {
        return SizedBox(
          height: 219.h,
          child: Center(child: ButtonLoading()),
        );
      }
      final reviews =
          controller.propertyReviews.value?.data?.reviews ?? const [];
      if (reviews.isEmpty) {
        return SizedBox();
      }
      return SizedBox(
        height: 219.h,
        width: MediaQuery.widthOf(context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            final comment = (review.comment ?? '')
                .replaceAll(RegExp(r'[\r\n]+'), ' ')
                .replaceAll(RegExp(r'\s{2,}'), ' ')
                .trim();

            return Container(
              margin: EdgeInsets.only(
                right: 10,
                top: 10.h,
                bottom: 10.h,
                left: 10.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 14.38.w,
                vertical: 23.96.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.89.r),
                gradient: isDark
                    ? linearGradient ??
                          LinearGradient(
                            colors: [
                              AppColors.darkPrimary,
                              AppColors.darkPrimary,
                            ],
                          )
                    : AppColors.userBackground,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3.72),
                    blurRadius: 13.03,
                    color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl: review.user?.image ?? "",
                    height: 86.27.h,
                    width: 81.12.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 252.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '"$comment"',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? AppColors.darkPrimaryText
                                    : AppColors.primaryDarkTextColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextPrimary(
                                  text: review.user?.name ?? 'User',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomTextSecondary(
                                  text:
                                      "${Get.find<PropertyViewController>().propertyDetails.value?.data?.state ?? 'State'}, ${Get.find<PropertyViewController>().propertyDetails.value?.data?.country ?? 'Country'}",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                RatingBarIndicator(
                                  rating: review.rating?.toDouble() ?? 0.0,
                                  itemCount: 5,
                                  itemSize: 12.sp,
                                  itemPadding: EdgeInsets.all(1.5.r),
                                  itemBuilder: (context, index) {
                                    return Image.asset(
                                      IconsPath.rating,
                                      color: AppColors.primaryColorDark,
                                    );
                                  },
                                ),
                              ],
                            ),
                            Image.asset(
                              IconsPath.review,
                              height: 33.51.h,
                              width: 37.77.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
