import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/auth/controllers/onboarding_controller.dart';
import 'package:renter_pay/features/auth/widgets/first_onboarding.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List imageList = [
      FirstOnboarding(),
      Image.asset(
        ImagesPath.onboardingScreen2,
        height: 612.h,
        width: MediaQuery.widthOf(context),
        fit: BoxFit.cover,
      ),
      Image.asset(
        ImagesPath.onboardingScreen3,
        height: 612.h,
        width: MediaQuery.widthOf(context),
        fit: BoxFit.cover,
      ),
      Image.asset(
        ImagesPath.onboardingScreen4,
        height: 612.h,
        width: MediaQuery.widthOf(context),
        fit: BoxFit.cover,
      ),
    ];
    List titleList = [
      "Simplify the Way\nYou Rent",
      "Property Management\nMade Simple",
      "Connect Tenants and\nLandlords Seamlessly",
      "Experience Homes\nfrom Anywhere",
    ];
    List subtitleList = [
      "Manage rent payments, submit maintenance\nrequests, and stay connected with your\nlandlord — all in one simple, secure app.",
      "Track rent payments, schedule inspections,\nand assign service vendors — all from your\nlandlord dashboard in RenterPay.",
      "Manage listings, handle tenant inquiries, and\nkeep every property transaction smooth and\nprofessional through RenterPay.",
      "Explore rental properties through Virtual Tour\n— walk through rooms, inspect details, and\nfall in love before you visit.",
    ];
    OnboardingController onboardingController = Get.find();
    ThemeController themeController = Get.find();
    return Obx(() {
      int index = onboardingController.currentPage.value;
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: ValueKey(index),
          children: [
            Stack(
              children: [
                imageList[index],
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  left: 0.w,
                  child: Container(
                    height: 150.h,
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      gradient: themeController.isDarkMode.value
                          ? LinearGradient(
                            begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.darkPrimary.withValues(alpha: 0.0),
                                AppColors.darkPrimary,
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.whiteColor.withValues(alpha: 0.0),
                                AppColors.whiteColor,
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: CustomTextPrimary(text: titleList[index]),
            ),
            SizedBox(height: 8.h,),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: CustomTextSecondary(text: subtitleList[index]),
            ),
          ],
        ),
      );
    });
  }
}
