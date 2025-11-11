import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/core/utils/snackbar.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/auth/widgets/user_button.dart';
import 'package:renter_pay/features/auth/widgets/user_container.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class UserRole extends StatelessWidget {
  const UserRole({super.key});

  @override
  Widget build(BuildContext context) {
    UserRoleController userRoleController = Get.find();
    ThemeController themeController = Get.find();
    return CustomContainer(
      gradient: themeController.isDarkMode.value?AppColors.darkAuthBG:AppColors.backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.appLogo, width: 170.w, height: 30.h),
              SizedBox(height: 48.h),
              CustomText.primaryText(
                text: 'Select a role for your account',
                fontSize: 24.sp,
                color: themeController.isDarkMode.value?AppColors.darkPrimaryText:AppColors.primaryDarkTextColor,
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserContainer(
                    image: IconsPath.tenantIcon,
                    title: "Tenant",
                    description: "Find your perfect House",
                    index: 0,
                  ),
                  UserContainer(
                    image: IconsPath.landLordIcon,
                    title: "Landlord",
                    description: "Sell your Home with Tenant",
                    index: 1,
                  ),
                ],
              ),
              SizedBox(height: 8.2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserContainer(
                    image: IconsPath.agentIcon,
                    title: "Agent",
                    description: "Find Agent for your Land",
                    index: 2,
                  ),
                  UserContainer(
                    image: IconsPath.serviceVendorIcon,
                    title: "Service Vendor",
                    description: "Get All Home Services",
                    index: 3,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              UserButton(
                backOnTap: () {
                  Get.back();
                },
                continueOnTap: () {
                  if(userRoleController.selectedIndex.value==-1){
                    errorSnack(message: "Please Select A User Role");
                  }else{
                    Get.toNamed(AppRoutes.signupOption);
                  }
                  
                },
              ),
            ],
          ),
        ),
      );
  }
}
