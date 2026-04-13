import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class PropertyBanner extends StatelessWidget {
  const PropertyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
      height: 300.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.44.r),
        image: DecorationImage(
          image: AssetImage(ImagesPath.propertyBanner),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImagesPath.appLogo,
            color: AppColors.whiteColor,
            width: 150.w,
            height: 30.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.h),
          CustomTextPrimary(
            text: 'Looking to Rent\na Property?',
            fontSize: 25.sp,
            color: AppColors.approveBG,
          ),
          CustomTextPrimary(
            text:
                'Schedule a visit today or talk\nto our agent for more details.',
            fontSize: 12.sp,
            color: Color(0xFFE6E9ED),
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 31.85.h,
              width: 170.w,
              padding: EdgeInsets.symmetric(
                vertical: 7.92.h,
                horizontal: 2.06.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.darkAppBar,
                borderRadius: BorderRadius.circular(4.53.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 2.w),
                  CustomTextPrimary(
                    text: 'Get a Free Consultation',
                    fontSize: 10.sp,
                    color: AppColors.primaryTextColor,
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(
                    IconsPath.consultation,
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 2.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
