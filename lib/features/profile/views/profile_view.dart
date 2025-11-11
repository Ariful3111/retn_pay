import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_info.dart';
import 'package:renter_pay/features/profile/widgets/profile_items_list.dart';
import 'package:renter_pay/shared/widgets/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    ThemeController themeController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gradient:themeController.isDarkMode.value? LinearGradient(colors: [AppColors.darkPrimary,AppColors.darkPrimary]):AppColors.userBackground.withOpacity(0.5),
      child: ListView(
      children: [
        CustomAppbar(title: 'Tenant Profile',image: IconsPath.profileDrawer, imageHeight: 12.h,imageWidth: 18.w, onTap: (){}),
        
        SizedBox(height: 24.h,),
        ProfileInfo(),
        SizedBox(height: 12.h,),
        ProfileItemsList(),
        CustomPrimaryButton(height: 52.h,text: 'Logout', onPressed: (){
          profileController.logOut();
        }),
        SizedBox(height: 8.h,)
      ],
    ));
  }
}