import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class ProfileUserItems extends StatelessWidget {
  const ProfileUserItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (userIndex == 1 || userIndex == 2 || userIndex == 3)
          ProfileItems(
            image: IconsPath.profileCalendar,
            imageHeight: 23.h,
            imageWidth: 21.w,
            title: 'Calendar',
            onTap: () {
              Get.find<MainHomeController>().selectIndex.value = 3;
            },
          ),
        if (userIndex == 1 || userIndex == 2 || userIndex == 3)
          SizedBox(height: 8.h),
        ProfileItems(
          image: IconsPath.profilePayment,
          imageHeight: 23.h,
          imageWidth: 21.w,
          title: 'Payment History',
          onTap: () async {},
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
          onTap: () {
            SuccessSnackbar.show(
              description: 'Navigate user to Web Privacy Policy',
            );
          },
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
