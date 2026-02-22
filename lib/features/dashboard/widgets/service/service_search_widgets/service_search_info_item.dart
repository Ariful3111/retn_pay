import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/dashboard/controllers/service_details_controller.dart';
import 'package:renter_pay/shared/extensions/Extractors/experience_extractor.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceSearchInfoItem extends GetWidget<ServiceDetailsController> {
  const ServiceSearchInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final (
      experienceTitle,
      experienceSubTitle,
    ) = (controller.serviceDetails.value?.data?.data?.first.experience ?? '')
        .extractExperienceParts();

    return Row(
      children: [
        Expanded(
          child: item(
            context: context,
            icon: IconsPath.serviceRating,
            title:
                controller
                    .serviceDetails
                    .value
                    ?.data
                    ?.data!
                    .first
                    .rating
                    ?.averageRating
                    ?.toString() ??
                '',
            subTitle:
                '(${controller.serviceDetails.value?.data?.data!.first.rating?.totalReviews?.toString() ?? ''}) reviews',
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: item(
            context: context,
            icon: IconsPath.serviceExp,
            title: experienceTitle,
            subTitle: experienceSubTitle,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: item(
            context: context,
            icon: IconsPath.serviceSupport,
            title:
                controller
                    .serviceDetails
                    .value
                    ?.data
                    ?.data!
                    .first
                    .supportTime ??
                '',
            subTitle: 'Emergency Support',
          ),
        ),
      ],
    );
  }

  Widget item({
    required BuildContext context,
    required String icon,
    required String title,
    required String subTitle,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.42),
            blurRadius: 24.16,
            color: AppColors.darkPrimary.withValues(alpha: 0.10),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 24.h, width: 24.w),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPrimary(
                  text: title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                  softWrap: false,
                  textOverflow: TextOverflow.ellipsis,
                ),
                CustomTextPrimary(
                  text: subTitle,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : Color(0xFF4C4D4E),
                  maxLines: 1,
                  softWrap: false,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
