import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/agent_document.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/landlord_profile_plan.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_details.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_info.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_property.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      padding: EdgeInsets.all(20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: "Edit Profile"),
            ],
          ),
          SizedBox(height: 24.h),
          ProfileEditInfo(
            profileEditController: Get.find(),
            profileController: Get.find(),
          ),
          SizedBox(height: 20.h),
          ProfileEditDetails(profileEditController: Get.find()),
          SizedBox(height: 20.h),
          if (userIndex == 0) ProfileEditProperty(),
          if (userIndex == 1 || userIndex == 3) LandlordProfilePlan(),
          if (userIndex == 2) AgentDocument(),
        ],
      ),
    );
  }
}
