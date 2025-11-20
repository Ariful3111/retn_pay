import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/features/auth/widgets/signup_field.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_span.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final fromKey = GlobalKey<FormState>();
    SignupController signupController = Get.find();
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.heightOf(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.appLogo, height: 30.h, width: 170.w),
              SizedBox(height: 20.h),
              CustomTextPrimary(text: "Fill Out Information", fontSize: 28.sp),
              SizedBox(height: 7.h),
              CustomTextPrimary(
                text: "Let's login to grab amazing deal",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              SignupField(fromKey: fromKey),
              SizedBox(height: 20.h),
              CustomPrimaryButton(
                height: 48.50.h,
                onPressed: () {
                  signupController.userSignup(fromKey);
                },
                text: "Signup",
                textColor: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 21.h),
              CustomTextSpan(
                title: "Do have an account?",
                spantext: " Login",
                onTap: () {
                  Get.toNamed(AppRoutes.loginView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
