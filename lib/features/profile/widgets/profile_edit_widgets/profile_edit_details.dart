import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_button.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_edit_field.dart';
import 'package:renter_pay/features/profile/widgets/profile_edit_widgets/profile_save_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class ProfileEditDetails extends StatelessWidget {
  final ProfileEditController profileEditController;
  const ProfileEditDetails({super.key, required this.profileEditController});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

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
                ProfileEditButton(
                  onTap: () {
                    profileEditController.isEdit.value =
                        !profileEditController.isEdit.value;
                  },
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
                  // ProfileEditField(
                  //   controller: profileEditController.emailController,
                  //   labelText: 'Email',
                  //   readOnly: profileEditController.isEdit.value ? false : true,
                  // ),
                  // SizedBox(height: 16.h),
                  // ProfileEditField(
                  //   controller: profileEditController.phoneController,
                  //   labelText: 'Phone',
                  //   readOnly: profileEditController.isEdit.value ? false : true,
                  // ),
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
                  profileEditController.isLoading.value
                      ? ButtonLoading()
                      : AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          child: profileEditController.isEdit.value
                              ? Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: ProfileSaveButton(
                                    onPressed: () async {
                                      if (profileEditController.isEdit.value) {
                                        await profileEditController
                                            .updateProfile();
                                      }
                                    },
                                  ),
                                )
                              : SizedBox(),
                        ),
                ],
              ),
            ),
            if (userIndex == 3) SizedBox(height: 16.h),
            if (userIndex == 3)
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: profileEditController.isEdit.value
                    ? ProfileSaveButton()
                    : SizedBox(),
              ),
          ],
        ),
      ),
    );
  }
}
