import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_items.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';

class ProfileItemsList extends StatelessWidget {
  const ProfileItemsList({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    UserRoleController userRoleController = Get.find();
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
            child: CustomTextPrimary(text: '3',fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xFF002256)),
          ),
        ), onTap: () { Get.toNamed(AppRoutes.notification); },
        ),
        SizedBox(height: 8.h,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           rowItem(IconsPath.profileDashboard, 'DashBoard', 23.h, 23.w,() {
             
           },),
           rowItem(IconsPath.profileBlog, 'Blog', 23.h, 23.w,() {
             
           },),
         ],
       ),
       SizedBox(height: 8.h),
       Obx((){
      return  Column(
        children: [
          ProfileItems(imageHeight: 21.5.h, imageWidth: 21.5.w, image: IconsPath.profileWeb, title: 'Web Assets',
           secondaryWidget: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
               profileController.isWebAsset.value= !profileController.isWebAsset.value;
            },
            child: SizedBox(
              height: 24.h,
              width: 24.h,
              child: Center(child: Image.asset(profileController.isWebAsset.value? IconsPath.upArrow:IconsPath.downArrow,height: 7.5.h,width: 15.w,))),
           ), onTap: () {  },
            ),
          AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(opacity: profileController.isWebAsset.value?1:0, duration: Duration(milliseconds: 200),
          child: profileController.isWebAsset.value?Column(
          children: [
           if(userRoleController.selectedIndex.value==3)ProfileItems(image: IconsPath.profileService,imageHeight: 24.h,imageWidth: 24.w,title: 'Create New Service', onTap: () {  },),
           if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileAgent,imageHeight: 24.h,imageWidth: 24.w,title: 'Agent Management', onTap: () {  },),
           if(userRoleController.selectedIndex.value==0)ProfileItems(image: IconsPath.profileApplication,imageHeight: 17.h,imageWidth: 18.w,title: 'Application', onTap: () {  },),
           if(userRoleController.selectedIndex.value==0)ProfileItems(image: IconsPath.profileAgreement,imageHeight: 23.h,imageWidth: 21.w,title: 'Agreement', onTap: () {  },),
           if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileApplication,imageHeight: 17.h,imageWidth: 18.w,title: 'Application', onTap: () {  },),
           if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileAgreement,imageHeight: 23.h,imageWidth: 21.w,title: 'Agreement', onTap: () {  },),
           if(userRoleController.selectedIndex.value==2)ProfileItems(image: IconsPath.profileApplication,imageHeight: 17.h,imageWidth: 18.w,title: 'Application', onTap: () {  },),
           if(userRoleController.selectedIndex.value==2)ProfileItems(image: IconsPath.profileAgreement,imageHeight: 23.h,imageWidth: 21.w,title: 'Agreement', onTap: () {  },),
           if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileTenant,imageHeight: 24.h,imageWidth: 24.w,title: 'Tenant Management', onTap: () {  },),
           if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileReport,imageHeight: 23.h,imageWidth: 19.w,title: 'Reporting & Analytics', onTap: () {  },),
           if(userRoleController.selectedIndex.value==2)ProfileItems(image: IconsPath.profileReport,imageHeight: 23.h,imageWidth: 19.w,title: 'Reporting & Analytics', onTap: () {  },),
            ],
           ):SizedBox(),
            ),
            ),
        ],
      );
       }
       ),
        SizedBox(height: 8.h,),
        if(userRoleController.selectedIndex.value==1)ProfileItems(image: IconsPath.profileCalendar,imageHeight: 23.h,imageWidth: 21.w,title: 'Calendar', onTap: () {  },),
        if(userRoleController.selectedIndex.value==1)SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profilePayment,imageHeight: 23.h,imageWidth: 21.w,title: 'Payment History', onTap: () {  },),
        SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profileSetting,imageHeight: 23.h,imageWidth: 21.w,title: 'Setting',onTap: (){
          Get.toNamed(AppRoutes.settings);
        },),
        SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profileContact,imageHeight: 23.h,imageWidth: 21.w,title: 'Contact Us', onTap: () {  },),
        SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profileSupport,imageHeight: 23.h,imageWidth: 21.w,title: 'Support', onTap: () {  },),
        SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profilePrivacy,imageHeight: 23.h,imageWidth: 21.w,title: 'Privacy Policy', onTap: () {  },),
        SizedBox(height: 8.h,),
        ProfileItems(image: IconsPath.profileTerms,imageHeight: 23.h,imageWidth: 21.w,title: 'Terms and Condition', onTap: () {  },),
        SizedBox(height: 8.h,),
      ],
    );
  }
  Widget rowItem(String image,String title,double imageHeight,double imageWidth, VoidCallback onTap){
    
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
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(child: Image.asset(image,height: imageHeight,width: imageWidth,),),
            ),
            SizedBox(height: 5.h),
          CustomTextPrimary(text: title,fontSize: 16.sp,fontWeight: FontWeight.w400,),
        ],
       ), onTap: onTap,);
  }

}