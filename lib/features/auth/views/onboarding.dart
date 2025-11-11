import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_page.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_slider.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:themeController.isDarkMode.value? AppColors.darkPrimary:AppColors.whiteColor,

      extendBodyBehindAppBar: true,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            OnboardingPage(),
            SizedBox(height: 48.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: OnboardingSlider(),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      );
  }
}
