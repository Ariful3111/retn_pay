import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w,right: 25.w,top: 20.h,bottom: 20.h),
          width: MediaQuery.widthOf(context),
          height: 105.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            gradient: AppColors.primaryColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Container(
                height: 65.h,
                width: 65.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.sp),
                  border: Border.all(width: 2.sp,color: Color(0xFFF0E6EC)),
                  image: DecorationImage(image: AssetImage(ImagesPath.profile))
                ),
                
              ),
              SizedBox(width: 16.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.primaryText(text: "Sadman Sakib",color: AppColors.whiteColor,fontSize: 20.sp),
                  SizedBox(height: 8.h,),
                  CustomText.primaryText(text: "sadmansakib@gmail.com",color: AppColors.whiteColor,fontSize: 16.sp,fontWeight: FontWeight.w400),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  
                },
                child: Image.asset(IconsPath.forwardArrow,height: 10.h,width: 5.w,),
              )
            ],
          ),
        );
  }
}