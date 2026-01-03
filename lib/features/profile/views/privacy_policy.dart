import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/introduction_policy.dart';
import 'package:renter_pay/features/profile/widgets/privacy_policy_widgets/policy_terms_helper.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:renter_pay/shared/widgets/custom_appbar/custom_appbar_leading.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';

class PrivacyPolicy extends StatelessWidget with PolicyTermsHelper {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return CustomContainer(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      gradient: isDark
          ? LinearGradient(
              colors: [AppColors.darkPrimary, AppColors.darkPrimary],
            )
          : AppColors.userBackground,
      child: ListView(
        children: [
          Row(
            children: [
              CustomAppbarLeading(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 8.w),
              CustomAppbar(title: 'Privacy Policy'),
            ],
          ),
          SizedBox(height: 24.h),
          titleText(
            text:
                'Privacy Policy for a Residential Property Management App in Victoria, Australia: A Legal and Operational Framework',
            fontSize: 20.sp,
            context: context,
          ),
          SizedBox(height: 16.h),
          titleText(
            text: '1. Introduction and Legal Framework',
            context: context,
          ),
          SizedBox(height: 8.h),
          IntroductionPolicy(),
        ],
      ),
    );
  }
}
