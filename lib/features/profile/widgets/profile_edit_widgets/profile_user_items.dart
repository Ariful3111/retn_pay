import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';

class ProfileUserItems extends StatelessWidget {
  const ProfileUserItems({super.key});

  @override
  Widget build(BuildContext context) {
    UserRoleController userRoleController = Get.find();
    return Column(
      children: [
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileCalendar,
            imageHeight: 23.h,
            imageWidth: 21.w,
            title: 'Calendar',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1) SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profilePayment,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Payment History',
          onTap: () {},
        ),
        SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profileSetting,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Setting',
          onTap: () {
            Get.toNamed(AppRoutes.settings);
          },
        ),
        SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profileContact,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Contact Us',
          onTap: () {
            Get.toNamed(AppRoutes.contactUs);
          },
        ),
        SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profileSupport,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Support',
          onTap: () {
            Get.toNamed(AppRoutes.supportView);
          },
        ),
        SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profilePrivacy,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Privacy Policy',
          onTap: () {},
        ),
        SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profileTerms,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Terms and Condition',
          onTap: () {},
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
