import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/auth/controllers/login_controller.dart';
import 'package:renter_pay/features/auth/controllers/social_login_controller.dart';
import 'package:renter_pay/features/auth/widgets/forgot_password.dart';
import 'package:renter_pay/features/auth/widgets/login_field.dart';
import 'package:renter_pay/features/auth/widgets/auth_option.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_span.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

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
              CustomTextPrimary(text: "Welcome Back", fontSize: 28.sp),
              SizedBox(height: 7.h),
              CustomTextPrimary(
                text: "Let's login to grab amazing deal",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              AuthOption(
                title: "Continue with Google",
                image: IconsPath.google,
                onTap: () async {
                  await Get.find<SocialLoginController>().googleLogin();
                },
              ),
              SizedBox(height: 20.h),
              AuthOption(
                title: "Continue with Apple",
                image: IconsPath.apple,
                onTap: () {},
              ),
              SizedBox(height: 20.h),
              LoginField(fromKey: fromKey),
              SizedBox(height: 7.h),
              ForgotPassword(),
              SizedBox(height: 20.h),
              Obx(() {
                return loginController.isLoading.value
                    ? ButtonLoading()
                    : CustomPrimaryButton(
                        onPressed: () async {
                          await loginController.userLogin(formKey: fromKey);
                        },
                        text: "Login",
                        borderRadius: BorderRadius.circular(7.r),
                        textColor: AppColors.whiteColor,
                        height: 48.50.h,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      );
              }),
              SizedBox(height: 20.h),
              CustomTextSpan(
                title: "Don't have an account?",
                spantext: " Sign Up",
                onTap: () {
                  loginController.signup(formKey: fromKey);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
