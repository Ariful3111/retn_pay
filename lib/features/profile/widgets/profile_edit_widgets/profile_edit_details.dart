import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_field.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_save_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileEditDetails extends StatelessWidget {
  const ProfileEditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileEditController profileEditController = Get.find();
    return Container(
      padding: EdgeInsets.all(16.r),
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
                  onTap: () {
                    profileEditController.isEdit.value =
                        !profileEditController.isEdit.value;
                  },
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
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileEditField(
                    controller: profileEditController.nameController,
                    labelText: 'First Name',
                    readOnly: profileEditController.isEdit.value ? false : true,
                  ),
                  SizedBox(height: 16.h),
                  ProfileEditField(
                    controller: profileEditController.lastNameController,
                    labelText: 'Last Name',
                    readOnly: profileEditController.isEdit.value ? false : true,
                  ),
                  SizedBox(height: 16.h),
                  ProfileEditField(
                    controller: profileEditController.emailController,
                    labelText: 'Email',
                    readOnly: profileEditController.isEdit.value ? false : true,
                  ),
                  SizedBox(height: 16.h),
                  ProfileEditField(
                    controller: profileEditController.phoneController,
                    labelText: 'Phone',
                    readOnly: profileEditController.isEdit.value ? false : true,
                  ),
                  SizedBox(height: 16.h),
                  ProfileEditField(
                    controller: profileEditController.passwordController,
                    labelText: 'Password',
                    readOnly: profileEditController.isEdit.value ? false : true,
                  ),

                  if (userIndex == 3)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        ProfileEditField(
                          controller:
                              profileEditController.businessNameController,
                          labelText: 'Business Name',
                          readOnly: profileEditController.isEdit.value
                              ? false
                              : true,
                        ),
                        SizedBox(height: 16.h),
                        ProfileEditField(
                          controller:
                              profileEditController.businessTypeController,
                          labelText: 'Business Type',
                          readOnly: profileEditController.isEdit.value
                              ? false
                              : true,
                        ),
                        SizedBox(height: 16.h),
                        ProfileEditField(
                          controller:
                              profileEditController.businessLicenseController,
                          labelText: 'Business License No',
                          readOnly: profileEditController.isEdit.value
                              ? false
                              : true,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (userIndex == 1 || userIndex == 2 || userIndex == 3)
              SizedBox(height: 16.h),
            if (userIndex == 1 || userIndex == 2 || userIndex == 3)
              ProfileSaveButton(),
          ],
        ),
      ),
    );
  }
}
