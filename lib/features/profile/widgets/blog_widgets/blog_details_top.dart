import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class BlogDetailsTop extends StatelessWidget {
  const BlogDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(children: [
                SizedBox(height: 20.h),
              CustomTextPrimary(text: 'How to Request\nMaintenance Properly',fontSize: 24.sp,textAlign: TextAlign.center,),
              SizedBox(height: 8.h,),
              CustomTextSecondary(text: 'Learn how to report issues clearly for\nfaster, smoother repairs.',fontWeight: FontWeight.w400,textAlign: TextAlign.center,),
              SizedBox(height: 8.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsPath.pen, height: 16.h, width: 16.w),
                    SizedBox(width: 8.w),
                    CustomTextSecondary(
                      text: 'By RenterPay Team',
                      fontSize: 12.sp,
                      color:isDark? Color(0xFFFAFBFB):AppColors.darkContainer,
                    ),
                  ],
                ),
                SizedBox(height: 24.h,),
                Container(
                  height: 250.h,
                  width: MediaQuery.widthOf(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    image: DecorationImage(image: AssetImage(ImagesPath.service),fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 16.h,),
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
              ],);
  }
}