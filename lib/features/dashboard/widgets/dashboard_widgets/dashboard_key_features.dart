import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class DashboardKeyFeatures extends StatelessWidget {
  const DashboardKeyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List keyFeatures = [
      '360° AR Room Tour - walk through the property with your phone.',
      'Furniture Placement - try out virtual furniture inside the space.',
      'Indoor/Outdoor View - toggle between interior and exterior AR views.',
      'Zoom & Rotate - examine details from every angle.',
    ];
    return Container(
      padding: EdgeInsets.all(21.79.r),
      height: 525.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:isDark?AppColors.darkPrimary: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(IconsPath.AR, height: 43.58.w, width: 43.58.w),
              SizedBox(width: 13.w),
              CustomTextPrimary(text: 'AR View Options', fontSize: 24.sp),
            ],
          ),
          SizedBox(height: 8.72.h),
          CustomTextSecondary(
            text:
                'Bring your future home to life with Augmented Reality. Place 3D models of rooms or furniture inside your real environment using your phone’s camera. Explore how the property fits into your lifestyle before you move in.',
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 13.07.h),
          CustomTextPrimary(text: 'Key Features:', fontSize: 20.sp),
          SizedBox(height: 8.72.h),
          ...List.generate(keyFeatures.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom:index==keyFeatures.length-1?  0:4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color:isDark? AppColors.darkSecondaryText:AppColors.secondaryTextColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextSecondary(
                      text: keyFeatures[index],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 26.h),
          CustomPrimaryButton(
            text: 'Launch AR View',
            height: 54.h, onPressed: () {
  
          },)
        ],
      ),
    );
  }
}
