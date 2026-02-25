import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_details_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceSearchOffered extends GetWidget<ServiceDetailsController> {
  const ServiceSearchOffered({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceDetailsContainer(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          controller
                  .serviceDetails
                  .value
                  ?.data
                  ?.data
                  ?.first
                  .servicesOffered
                  ?.length ??
              0,
          (index) {
            final value = controller
                .serviceDetails
                .value
                ?.data
                ?.data
                ?.first
                .servicesOffered?[index];

            return item(
              context: context,
              icon:
                  value?.icon ??
                  "https://cdn-icons-png.flaticon.com/512/5062/5062832.png",
              title: value?.title ?? '',
              subTitle: value?.shortDescription ?? '',
            );
          },
        ),
      ),
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
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: isDark ? AppColors.darkAuthBG : AppColors.userBackground,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5.78),
            blurRadius: 20.22,
            color: AppColors.dropShadowColor.withValues(alpha: 0.10),
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: icon, height: 28.89.h, width: 28.89.w),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPrimary(
                  text: title,
                  fontSize: 16.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkContainer,
                ),
                CustomTextPrimary(
                  text: subTitle,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : AppColors.subsPlanSubtitle,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
