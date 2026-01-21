import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/features/auth/widgets/service_vendor_fields.dart';
import 'package:renter_pay/shared/extensions/Validators/confirm_password_validator.dart';
import 'package:renter_pay/shared/extensions/Validators/email_validator.dart';
import 'package:renter_pay/shared/extensions/Validators/name_validator.dart';
import 'package:renter_pay/shared/extensions/Validators/password_validator.dart';
import 'package:renter_pay/shared/extensions/Validators/phone_validator.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';

class SignupField extends StatelessWidget {
  final GlobalKey<FormState> fromKey;
  const SignupField({super.key, required this.fromKey});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    return Form(
      key: fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Enter You're Name",
            labelText: "Name",
            controller: signupController.nameController,
            validator: nameValidation,
            validation: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          CustomTextField(
            hintText: "Enter you're Email",
            labelText: "Email",
            controller: signupController.emailController,
            validator: emailValidation,
            validation: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          CustomTextField(
            hintText: "Enter You're Phone Number",
            labelText: "Phone Number",
            controller: signupController.phoneController,
            validator: phoneValidation,
            keyboardType: TextInputType.number,
            validation: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 14.h),
          Obx(() {
            return CustomTextField(
              hintText: "Enter You're Password",
              labelText: "Password",
              controller: signupController.passwordController,
              validator: passwordValidation,
              obscureText: signupController.isPasswordVisible.value,
              validation: AutovalidateMode.onUserInteraction,
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.isPasswordVisible.value =
                      !signupController.isPasswordVisible.value;
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
              validator: (value) => confirmPasswordValidation(
                signupController.passwordController.text,
                value,
              ),
              obscureText: signupController.isConfirmPasswordVisible.value,
              validation: AutovalidateMode.onUserInteraction,
              suffixIcon: GestureDetector(
                onTap: () {
                  signupController.isConfirmPasswordVisible.value =
                      !signupController.isConfirmPasswordVisible.value;
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Image.asset(
                    signupController.isConfirmPasswordVisible.value
                        ? IconsPath.passwordVisibility
                        : IconsPath.passwordVisibility,
                    height: 21.h,
                    width: 21.w,
                  ),
                ),
              ),
            );
          }),
          if(userIndex==3) ServiceVendorFields()
        ],
      ),
    );
  }
}
