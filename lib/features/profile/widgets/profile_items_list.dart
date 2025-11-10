import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/widgets/profile_items.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class ProfileItemsList extends StatelessWidget {
  const ProfileItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItems(imageHeight: 23.h, imageWidth: 22.w, image: IconsPath.profileNotification, title: 'Notifications',secondaryWidget: Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: Color(0xFFF0E6EC),

          ),
          child: Center(
            child: CustomText.primaryText(text: '3',fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xFF002256)),
          ),
        ),
        ),
        SizedBox(height: 8.h,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           rowItem(IconsPath.profileDashboard, 'DashBoard', 23.h, 23.w),
           rowItem(IconsPath.profileBlog, 'Blog', 23.h, 23.w),
         ],
       )
      ],
    );
  }
  Widget rowItem(String image,String title,double imageHeight,double imageWidth){
    return ProfileItems(
      height: 100.h,
      width: 191.w,
        padding: EdgeInsets.only(left: 12.w,top: 16.5,bottom: 16.5),
        primaryWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFEEF8),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Center(child: Image.asset(image,height: imageHeight,width: imageWidth,),),
            ),
          CustomText.primaryText(text: title,fontSize: 16.sp,fontWeight: FontWeight.w400),
        ],
       ),);
  }

}