import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceReview extends StatelessWidget {
  const ServiceReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          top: 16.h,
          bottom: 16.h,
          right: 8.w,
        ),
        width: MediaQuery.widthOf(context),
        height: 820.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isDark ? AppColors.darkSecondary : AppColors.whiteColor,
        ),
        child: ListView(
          children: List.generate(20, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.serviceSearchDetails);
                },
                child: Row(
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.39.r),
                        image: DecorationImage(
                          image: AssetImage(ImagesPath.service),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextPrimary(text: 'Plumbing', fontSize: 20.sp),
                          SizedBox(height: 4.h),
                          CustomTextSecondary(
                            text:
                                'We provide reliable plumbing services for homes and businesses, covering everything from leak repairs to full installations. Our skilled team ensures quick, professional',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 8.h),
                          CustomRatingBar(rating: 5.0, itemSize: 16.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
