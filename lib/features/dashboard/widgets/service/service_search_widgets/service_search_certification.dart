import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';
import 'package:renter_pay/features/dashboard/widgets/service/service_details_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ServiceSearchCertification extends StatelessWidget {
  const ServiceSearchCertification({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceSearchController serviceSearchController = Get.find();
    return ServiceDetailsContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h,),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11.43.w,
              mainAxisSpacing: 11.43.w,
              childAspectRatio: 1.15
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: serviceSearchController.certificationItem.length,
            itemBuilder: (context, index) {
              final list = serviceSearchController.certificationItem[index];
              return item(
                context: context,
                icon: list['icon'],
                title: list['title'],
                subTitle: list['subTitle'],
              );
            },
          ),
        ],
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
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.57.r),
        border: Border.all(width: 1.43.r, color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5.71),
            blurRadius: 20,
            color: AppColors.dropShadowColor.withValues(alpha: 0.10),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            icon,
            height: 46.43.w,
            width: 46.43,
            
          ),
          SizedBox(height: 10.h),
          CustomTextPrimary(text: title, fontSize: 12.sp,textAlign: TextAlign.center,color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,),
          SizedBox(height: 10.h),
          CustomTextSecondary(
            text: subTitle,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.buttonShadowColor,
                textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
