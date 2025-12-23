import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/dashboard/widgets/dashboard_widgets/notice_button_model.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ActivePropertyContact extends StatelessWidget {
  const ActivePropertyContact({super.key,});

  @override
  Widget build(BuildContext context) {
   bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(ImagesPath.house, height: 43.58.h, width: 43.58.w),
            SizedBox(width: 13.07.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextPrimary(
                  text: 'Ariful Islam',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextSecondary(
                  text: '+233844423443334',
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        CustomTextSecondary(
          text:
              'A landlord is an individual or entity that owns property and rents it out to tenants. They are responsible for maintaining the property, ensuring...',
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextSecondary(
                  text: 'Lease Duration',
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightText,
                ),
                SizedBox(height: 5.h),
                CustomTextSecondary(
                  fontSize: 20.sp,
                  text: '23 Aug 2025',
                  color:isDark?AppColors.darkSecondaryText :AppColors.darkContainer,
                ),
              ],
            ),
            NoticeButtonModel(
              width: 92.w.w,
              height: 40.h,
              onTap: () {},
              icon: IconsPath.dashboardChat,
              text: 'Chat',
              borderColorDark: AppColors.secondaryTextColor,
              shadowColor: AppColors.buttonShadowColor.withValues(
                alpha: 0.06,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
