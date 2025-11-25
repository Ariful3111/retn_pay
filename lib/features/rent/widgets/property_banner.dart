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
      padding: EdgeInsets.all(20.r),
      height: 306.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.44.r),
        image: DecorationImage(image: AssetImage(ImagesPath.propertyBanner),fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImagesPath.appLogo,color: AppColors.whiteColor,width: 131.7.w,height: 30.h,),
          SizedBox(height: 12.h,),
          CustomTextPrimary(text: 'Looking to Rent\na Property?',fontSize: 24.sp,color: Color(0xFFEBF1F2),),
          CustomTextPrimary(text: 'Schedule a visit today or talk\nto our agent for more details.',fontSize: 14.sp,color: Color(0xFFE6E9ED),fontWeight: FontWeight.w400,),
          SizedBox(height: 16.h,),
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 31.85.h,
              width: 162.77.w,
              padding: EdgeInsets.symmetric(vertical: 7.92.h,horizontal: 2.06.w),
              decoration: BoxDecoration(
                color: AppColors.darkAppBar,
                borderRadius: BorderRadius.circular(4.53.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextPrimary(text: 'Get a Free Consultation',fontSize: 12.sp,color: AppColors.primaryTextColor,),
                  Image.asset(IconsPath.consultation,height: 16.h,width: 16.w,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}