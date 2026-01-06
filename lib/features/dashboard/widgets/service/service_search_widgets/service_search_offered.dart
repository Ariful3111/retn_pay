import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceSearchOffered extends StatelessWidget {
  const ServiceSearchOffered({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return ServiceDetailsContainer(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(serviceSearchController.offeredItem.length, (
          index,
        ) {
          final list = serviceSearchController.offeredItem[index];

          return item(
            context: context,
            icon: list['icon'],
            title: list['title'],
            subTitle: list['subTitle'],
          );
        }),
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
          Image.asset(icon, height: 28.89.h, width: 28.89.w),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
