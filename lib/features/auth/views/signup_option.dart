import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/widgets/auth_option.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';

class SignupOption extends StatelessWidget {
  const SignupOption({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
   return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesPath.appLogo,height: 30.h,width: 170.w,),
          SizedBox(height: 20.h,),
          CustomTextPrimary(text: "Create New Account", fontSize: 28.sp),
          SizedBox(height: 7.h),
          CustomTextPrimary(
            text: "Let's login to grab amazing deal",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.h,),
          AuthOption(title: "Continue with Google", image: IconsPath.google, onTap: (){}),
          SizedBox(height: 20.h,),
          AuthOption(title: "Continue with Apple", image: IconsPath.apple,imageColor: isDark?AppColors.whiteColor:null, onTap: (){}),
          SizedBox(height: 20.h,),
          AuthOption(title: "Continue with Email/Phone", image: IconsPath.emailPhone, onTap: (){Get.toNamed(AppRoutes.loginView);}),
          SizedBox(height: 20.h,),
           CustomTextSpan(title: "Don't have an account?", spantext: " Sign Up",onTap: (){Get.toNamed(AppRoutes.signupView);}),
        ],
      ),
      );
  }
}