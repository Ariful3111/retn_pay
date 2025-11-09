import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_page.dart';
import 'package:renter_pay/features/auth/widgets/onboarding_slider.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
        body: ListView(
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
