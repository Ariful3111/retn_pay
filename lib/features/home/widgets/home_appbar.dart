import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_notification_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class HomeAppbar extends StatelessWidget {
  final ProfileController profileController;
  const HomeAppbar({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return profileController.profileData.value == null
          ? ButtonLoading()
          : Row(
              children: [
                if (profileController.profileData.value?.data?.avatar
                        .toString() !=
                    "null")
                  CachedNetworkImage(
                    imageUrl:
                        profileController.profileData.value?.data?.avatar ?? '',
                    height: 44.h,
                    width: 44.w,
                  )
                else
                  Image.asset(ImagesPath.homeAppbar, height: 44.h, width: 44.w),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextPrimary(
                        text:
                            'Hi,${profileController.profileData.value?.data?.name ?? ''}',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      CustomTextSecondary(
                        text: 'Welcome to Renterpay',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textOverflow: TextOverflow.ellipsis,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkSecondaryText
                            : AppColors.primaryDarkTextColor.withValues(
                                alpha: 0.80,
                              ),
                      ),
                    ],
                  ),
                ),
                CustomNotificationButton(),
              ],
            );
    });
  }
}
