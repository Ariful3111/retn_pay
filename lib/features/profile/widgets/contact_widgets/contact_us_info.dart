import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/services/url_service.dart';
import 'package:renter_pay/features/auth/controllers/get_settings_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<GetSettingsController>().settings.value?.data;

    List iconList = <String>[
      IconsPath.call,
      IconsPath.email,
      IconsPath.web,
      IconsPath.contactLocation,
    ];
    List infoList = <String>[
      settings?.phone ?? '',
      settings?.email ?? '',
      settings?.web ?? '',
      settings?.address ?? '',
    ];

    // Build social media list dynamically (only if URL is not # or empty)
    List<Map<String, String>> socialMediaList = [];
    if (settings?.facebook != null &&
        settings!.facebook!.isNotEmpty &&
        settings.facebook != '#') {
      socialMediaList.add({
        'icon': IconsPath.facebook,
        'url': settings.facebook!,
      });
    }
    if (settings?.instagram != null &&
        settings!.instagram!.isNotEmpty &&
        settings.instagram != '#') {
      socialMediaList.add({
        'icon': IconsPath.instagram,
        'url': settings.instagram!,
      });
    }
    if (settings?.tiktok != null &&
        settings!.tiktok!.isNotEmpty &&
        settings.tiktok != '#') {
      socialMediaList.add({'icon': IconsPath.tiktok, 'url': settings.tiktok!});
    }
    if (settings?.youtube != null &&
        settings!.youtube!.isNotEmpty &&
        settings.youtube != '#') {
      socialMediaList.add({
        'icon': IconsPath.youtube,
        'url': settings.youtube!,
      });
    }
    return Container(
      padding: EdgeInsets.only(top: 31.h, left: 31.w, bottom: 30.h),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(ImagesPath.contactUsBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextPrimary(
            text: 'Contact Information',
            fontSize: 24.sp,
            color: Color(0xFFFAFBFB),
          ),
          SizedBox(height: 12.h),
          CustomTextSecondary(
            text:
                Get.find<GetSettingsController>()
                    .settings
                    .value
                    ?.data
                    ?.contactMessage ??
                '',
            color: AppColors.darkSecondaryText,
          ),
          SizedBox(height: 40.h),
          ...List.generate(iconList.length, (index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    if (index == 0) {
                      await URLService.launchDialpad(phone: infoList[index]);
                    } else if (index == 1) {
                      await URLService.launchEmail(email: infoList[index]);
                    } else if (index == 2) {
                      await URLService.launchURL(url: infoList[index]);
                    } else if (index == 3) {
                      await URLService.launchURL(
                        url:
                            "https://www.google.com/maps/search/?api=1&query=${infoList[index]}",
                      );
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        iconList[index],
                        height: 19.06.h,
                        width: 19.06.w,
                      ),
                      SizedBox(width: 9.53.w),
                      Expanded(
                        child: CustomTextSecondary(
                          text: infoList[index],
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.h),
              ],
            );
          }),
          SizedBox(height: 20.h),
          if (socialMediaList.isNotEmpty)
            Row(
              children: List.generate(socialMediaList.length, (index) {
                return GestureDetector(
                  onTap: () async {
                    await URLService.launchURL(
                      url: socialMediaList[index]['url']!,
                    );
                  },
                  child: Container(
                    height: 31.77.h,
                    width: 31.77,
                    margin: EdgeInsets.only(right: 12.71.w),
                    child: Image.asset(socialMediaList[index]['icon']!),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}
