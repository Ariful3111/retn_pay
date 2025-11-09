import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/login_controller.dart';
import 'package:renter_pay/features/auth/widgets/forgot_password.dart';
import 'package:renter_pay/features/auth/widgets/login_field.dart';
import 'package:renter_pay/features/auth/widgets/auth_option.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    final fromKey = GlobalKey<FormState>();
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.heightOf(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.appLogo, height: 30.h, width: 170.w),
              SizedBox(height: 20.h),
              CustomText.primaryText(text: "Wellcome Back", fontSize: 28.sp),
              SizedBox(height: 7.h),
              CustomText.primaryText(
                text: "Let's login to grab amazing deal",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              AuthOption(title: "Continue with Google", image: IconsPath.google, onTap: () {}),
              SizedBox(height: 20.h),
              AuthOption(title: "Continue with Apple", image: IconsPath.apple, onTap: () {}),
              SizedBox(height: 20.h),
              LoginField(fromKey: fromKey),
              SizedBox(height: 7.h),
              ForgotPassword(),
              SizedBox(height: 20.h),
              CustomPrimaryButton(
                onPressed: () {
                  loginController.userLogin(fromKey);
                },
                text: "Login",
                borderRadius: BorderRadius.circular(7.r),
                textColor: AppColors.whiteColor,
                height: 48.50.h,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              CustomText.spanText(
                title: "Don't have an account?",
                spantext: " Sign Up",
                onTap: () {
                  Get.toNamed(AppRoutes.signupOption);
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
