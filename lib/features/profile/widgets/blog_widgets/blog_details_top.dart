import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/controllers/blog_details_controller.dart';
import 'package:renter_pay/shared/extensions/formatters/date_time_formatter.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogDetailsTop extends GetWidget<BlogDetailsController> {
  const BlogDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomTextPrimary(
          text: controller.blogDetails.value?.data?.title ?? '',
          fontSize: 24.sp,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        CustomTextSecondary(
          text: controller.blogDetails.value?.data?.excerpt ?? '',
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsPath.pen, height: 16.h, width: 16.w),
            SizedBox(width: 8.w),
            CustomTextSecondary(
              text:
                  controller.blogDetails.value?.data?.author?.name.toString() ==
                      "null"
                  ? "By RenterPay Team"
                  : controller.blogDetails.value?.data?.author?.name
                            .toString() ??
                        "",
              fontSize: 12.sp,
              color: isDark ? Color(0xFFFAFBFB) : AppColors.darkContainer,
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Container(
          height: 250.h,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                controller.blogDetails.value?.data?.featuredImage ?? '',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextSecondary(
              text:
                  controller.blogDetails.value?.data?.publishedAt
                      ?.toDMMMyyyy() ??
                  '',
              fontSize: 12.sp,
              color: AppColors.darkLightText,
            ),
            CustomTextSecondary(
              text: '2 min read',
              fontSize: 12.sp,
              color: AppColors.darkLightText,
            ),
          ],
        ),
      ],
    );
  }
}
