import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_items.dart';

class WebAssetItems extends StatelessWidget {
  const WebAssetItems({super.key});

  @override
  Widget build(BuildContext context) {
    UserRoleController userRoleController = Get.find();
    return Column(
      children: [
        if (userRoleController.selectedIndex.value == 3)
          ProfileItems(
            image: IconsPath.profileService,
            imageHeight: 24.h,
            imageWidth: 24.w,
            title: 'Create New Service',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileAgent,
            imageHeight: 24.h,
            imageWidth: 24.w,
            title: 'Agent Management',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 0)
          ProfileItems(
            image: IconsPath.profileApplication,
            imageHeight: 17.h,
            imageWidth: 18.w,
            title: 'Application',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 0)
          ProfileItems(
            image: IconsPath.profileAgreement,
            imageHeight: 23.h,
            imageWidth: 21.w,
            title: 'Agreement',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileApplication,
            imageHeight: 17.h,
            imageWidth: 18.w,
            title: 'Application',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileAgreement,
            imageHeight: 23.h,
            imageWidth: 21.w,
            title: 'Agreement',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 2)
          ProfileItems(
            image: IconsPath.profileApplication,
            imageHeight: 17.h,
            imageWidth: 18.w,
            title: 'Application',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 2)
          ProfileItems(
            image: IconsPath.profileAgreement,
            imageHeight: 23.h,
            imageWidth: 21.w,
            title: 'Agreement',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileTenant,
            imageHeight: 24.h,
            imageWidth: 24.w,
            title: 'Tenant Management',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 1)
          ProfileItems(
            image: IconsPath.profileReport,
            imageHeight: 23.h,
            imageWidth: 19.w,
            title: 'Reporting & Analytics',
            onTap: () {},
          ),
        if (userRoleController.selectedIndex.value == 2)
          ProfileItems(
            image: IconsPath.profileReport,
            imageHeight: 23.h,
            imageWidth: 19.w,
            title: 'Reporting & Analytics',
            onTap: () {},
          ),
      ],
    );
  }
}
