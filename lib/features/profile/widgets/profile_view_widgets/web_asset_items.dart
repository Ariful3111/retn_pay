import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/services/url_service.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items.dart';

class WebAssetItems extends StatelessWidget {
  const WebAssetItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          if (userIndex == 3)
            ProfileItems(
              image: IconsPath.profileService,
              imageHeight: 24.h,
              imageWidth: 24.w,
              title: 'Create New Service',
              onTap: () {},
            ),
          if (userIndex == 1)
            ProfileItems(
              image: IconsPath.profileAgent,
              imageHeight: 24.h,
              imageWidth: 24.w,
              title: 'Agent Management',
              onTap: () async {
                await URLService.launchURL(
                  url:
                      "https://renter-pay-web.vercel.app/landlord/dashboard/agent-management",
                );
              },
            ),
          if (userIndex == 0 || userIndex == 1 || userIndex == 2)
            ProfileItems(
              image: IconsPath.profileApplication,
              imageHeight: 17.h,
              imageWidth: 18.w,
              title: 'Application Management',
              onTap: () {
                Get.toNamed(AppRoutes.applicationManagementDetails);
                Get.find<DashboardController>().isItemSelect.value = 1;
              },
            ),
          if (userIndex == 0 || userIndex == 1 || userIndex == 2)
            ProfileItems(
              image: IconsPath.profileAgreement,
              imageHeight: 23.h,
              imageWidth: 21.w,
              title: 'Agreement',
              onTap: () {
                Get.toNamed(AppRoutes.agreementView);
                Get.find<DashboardController>().isItemSelect.value = 3;
              },
            ),
          if (userIndex == 1)
            ProfileItems(
              image: IconsPath.profileTenant,
              imageHeight: 24.h,
              imageWidth: 24.w,
              title: 'Tenant Management',
              onTap: () {},
            ),
          if (userIndex == 1 || userIndex == 2)
            ProfileItems(
              image: IconsPath.profileReport,
              imageHeight: 23.h,
              imageWidth: 19.w,
              title: 'Reporting & Analytics',
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
