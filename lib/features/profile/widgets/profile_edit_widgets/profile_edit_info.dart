import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/utils/image_picker.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ProfileEditInfo extends StatelessWidget {
  final ProfileEditController profileEditController;
  final ProfileController profileController;
  const ProfileEditInfo({
    super.key,
    required this.profileEditController,
    required this.profileController,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.only(
        top: 16.w,
        left: 16.w,
        bottom: 32.h,
        right: 16.w,
      ),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.r,
          color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextSecondary(
            text: 'Profile Information',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Obx(
                () => Container(
                  height: 74.h,
                  width: 74.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: profileEditController.upload.value != null
                          ? FileImage(
                              File(profileEditController.upload.value!.path),
                            )
                          : CachedNetworkImageProvider(
                              profileController.profileData.value?.data?.image
                                      .toString() ??
                                  '',
                            ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: Alignment(0.1, 1.5),
                    child: GestureDetector(
                      onTap: () {
                        UploadImage.sendImage(
                          picker: profileEditController.picker,
                          pickImage: profileEditController.upload,
                          context: context,
                        );
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: isDark
                              ? AppColors.darkSecondary
                              : AppColors.whiteColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            IconsPath.upload,
                            height: 20.h,
                            width: 20.w,
                            color: isDark ? AppColors.darkAppBar : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPrimary(
                    text: profileController.profileData.value?.data?.name ?? '',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextPrimary(
                    text:
                        profileController
                            .profileData
                            .value
                            ?.data
                            ?.roles
                            ?.first ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
