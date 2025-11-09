import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class SignupField extends StatelessWidget {
  final GlobalKey<FormState> fromKey;
  const SignupField({super.key, required this.fromKey});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    return Form(
      key: fromKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Enter You're Name",
            labelText: "Name",
            controller: signupController.nameController,
            validator: signupController.nameValidation,
          ),
          SizedBox(height: 14.h),
          CustomTextField(
            hintText: "Enter you're Email",
            labelText: "Email",
            controller: signupController.emailController,
            validator: signupController.emailValidation,
          ),
          SizedBox(height: 14.h),
          CustomTextField(
            hintText: "Enter You're Phone Number",
            labelText: "Phone Number",
            controller: signupController.phoneController,
            validator: signupController.phoneValidation,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 14.h),
          Obx(() {
            return CustomTextField(
              hintText: "Enter You're Password",
              labelText: "Password",
              controller: signupController.passwordController,
              validator: signupController.passwordValidation,
              obscureText: signupController.isPasswordVisible.value,
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.togglePasswordVisibility();
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Image.asset(
                    signupController.isPasswordVisible.value
                        ? IconsPath.passwordVisibility
                        : IconsPath.passwordVisibility,
                    height: 21.h,
                    width: 21.w,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 14.h),
          Obx(() {
            return CustomTextField(
              hintText: "Re Enter You're Password",
              labelText: "Confirm Password",
              controller: signupController.confirmPassController,
              validator: signupController.confirmPasswordValidation,
              obscureText: signupController.isConfirmPasswordVisible.value,
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.toggleConfirmPasswordVisibility();
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Image.asset(
                    signupController.isPasswordVisible.value
                        ? IconsPath.passwordVisibility
                        : IconsPath.passwordVisibility,
                    height: 21.h,
                    width: 21.w,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
