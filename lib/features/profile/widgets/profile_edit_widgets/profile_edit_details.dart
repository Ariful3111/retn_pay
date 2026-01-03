import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileEditDetails extends StatelessWidget {
  const ProfileEditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileEditController profileEditController = Get.find();
    return Container(
      height: 443.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextSecondary(
                  text: 'Personal Details',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 41.h,
                    width: 86.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          IconsPath.profileEdit,
                          height: 18.h,
                          width: 18.w,
                        ),
                        CustomTextSecondary(
                          text: 'Edit',
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ProfileEditField(
              controller: profileEditController.nameController,
              labelText: 'Name',
              hintText: 'Ariful Islam',
            ),
            SizedBox(height: 16.h),
            ProfileEditField(
              controller: profileEditController.emailController,
              labelText: 'Email',
              hintText: 'example@gmail.com',
            ),
            SizedBox(height: 16.h),
            ProfileEditField(
              controller: profileEditController.phoneController,
              labelText: 'Phone',
              hintText: '+08801524545',
            ),
            SizedBox(height: 16.h),
            ProfileEditField(
              controller: profileEditController.passwordController,
              labelText: 'Password',
              hintText: '**********',
            ),
          ],
        ),
      ),
    );
  }
}
