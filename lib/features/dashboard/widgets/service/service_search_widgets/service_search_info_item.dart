import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ServiceSearchInfoItem extends StatelessWidget {
  const ServiceSearchInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              item(
                context: context,
                icon: IconsPath.serviceRating,
                title: '4.9',
                subTitle: '(230) reviews',
              ),
              item(
                context: context,
                icon: IconsPath.serviceExp,
                title: '10+',
                subTitle: 'Years of Experience',
              ),
              item(
                context: context,
                icon: IconsPath.serviceSupport,
                title: '24/7',
                subTitle: 'Emergency Support',
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(icon, height: 24.h, width: 24.w),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPrimary(
                text: title,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              CustomTextPrimary(
                text: subTitle,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.darkSecondaryText : Color(0xFF4C4D4E),
              ),
            ],
          ),
        ],
      ),
    );
  }
}