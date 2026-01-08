import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/logout_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_info.dart';
import 'package:renter_pay/features/profile/widgets/profile_view_widgets/profile_items_list.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutController logoutController = Get.find();
    ProfileController profileController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      drawer: Drawer(),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground.withOpacity(0.5),
      child: CustomScrollView(
        controller: profileController.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            titleSpacing: 0.w,
            title: Obx(() {
              return CustomAppbar(title: roleDetector());
            }),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ProfileInfo(controller: profileController),
                SizedBox(height: 12.h),
                ProfileItemsList(),
                Obx(() {
                  return logoutController.isLoading.value
                      ? ButtonLoading()
                      : CustomPrimaryButton(
                          height: 52.h,
                          text: 'Logout',
                          onPressed: () async {
                            await logoutController.logout();
                          },
                        );
                }),
                SizedBox(height: 20.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  String roleDetector() {
    ProfileController profileController = Get.find();
    if (profileController.profileData.value == null) {
      return 'User';
    } else {
      return profileController
          .profileData
          .value!
          .data!
          .roles!
          .first
          .capitalizeFirst
          .toString();
    }
  }
}
