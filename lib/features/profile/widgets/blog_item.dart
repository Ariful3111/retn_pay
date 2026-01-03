import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.blogDetails);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 14.44.h),
            padding: EdgeInsets.all(14.r),
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                width: 1.r,
                color: isDark ? AppColors.darkContainer : AppColors.whiteBorder,
              ),
              color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5.78),
                  blurRadius: 20.22,
                  color: AppColors.dropShadowColor.withValues(alpha: 0.10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 158.88.h,
                  width: MediaQuery.widthOf(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.service),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextSecondary(
                      text: '10 Oct, 2025',
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
                SizedBox(height: 8.67.h),
                CustomTextPrimary(
                  text: 'How to Request Maintenance Properly',
                  fontSize: 18.sp,
                ),
                SizedBox(height: 5.78),
                CustomTextSecondary(
                  text:
                      'Learn how to report issues clearly for faster, smoother repairs.',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 5.78),
                Row(
                  children: [
                    Image.asset(IconsPath.pen, height: 16.h, width: 16.w),
                    SizedBox(width: 5.78.w),
                    CustomTextSecondary(
                      text: 'By RenterPay Team',
                      fontSize: 12.sp,
                      color: isDark
                          ? Color(0xFFFAFBFB)
                          : AppColors.darkContainer,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
