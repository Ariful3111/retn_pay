import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserRoleController userRoleController = Get.find();
    GlobalScrollController globalScrollController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        controller: globalScrollController.scrollController,
        children: [
          CustomAppbar(
            title: profileController
                .profileList[userRoleController.selectedIndex.value],
          ),
          SizedBox(height: 24.h,),
        ],
      ),
    );
  }
}
