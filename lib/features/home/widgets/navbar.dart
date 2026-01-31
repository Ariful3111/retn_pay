import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';
import 'package:renter_pay/features/home/widgets/nav_chat.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomeController mainHomeController = Get.find();
    ProfileController profileController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkPrimary.withValues(alpha: 0.80)
              : AppColors.whiteColor.withValues(alpha: 0.80),
          border: Border.all(
            width: 1.sp,
            color: isDark ? AppColors.darkBorderPrimary : AppColors.whiteBorder,
          ),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(mainHomeController.navItems.length, (index) {
            bool itemCount = mainHomeController.selectIndex.value == index;
            final navItem = mainHomeController.navItems[index];
            final navIcon = navItem['icon'];
            final navLabel = navItem['label'];
            bool isColor = navItem['isColor'];
            return Expanded(
              child: InkWell(
                onTap: () {
                  mainHomeController.changeIndex(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    navLabel != 'Chat'
                        ? navLabel == "Profile"
                              ? Obx(() {
                                  return CachedNetworkImage(
                                    imageUrl:
                                        profileController
                                            .profileData
                                            .value
                                            ?.data
                                            ?.image ??
                                        '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        ButtonLoading(loadingSize: 15.sp),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  );
                                })
                              : Image.asset(
                                  navIcon,
                                  color: isColor
                                      ? itemCount
                                            ? AppColors.primaryColorDark
                                            : isDark
                                            ? AppColors.darkPrimaryText
                                            : AppColors.secondaryTextColor
                                      : null,
                                  height: 24.h,
                                  width: 24.w,
                                )
                        : SizedBox(
                            child: NavChat(
                              isColor: isColor,
                              itemCount: itemCount,
                            ),
                          ),
                    SizedBox(height: 10.h),
                    Text(
                      navLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: itemCount
                          ? GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.borderColor,
                            )
                          : GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? AppColors.darkPrimaryText
                                  : AppColors.secondaryTextColor,
                            ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
