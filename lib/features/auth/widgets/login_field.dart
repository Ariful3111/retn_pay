import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/icons_path.dart';
import 'package:renter_pay/features/auth/controllers/login_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class LoginField extends StatelessWidget {
  final GlobalKey<FormState> fromKey;

  const LoginField({
    super.key,
    required this.fromKey,
  });

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Form(
      key: fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(height: 1.h, width: 179.w, color: Color(0xFFCBD5E1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.75.w),
                child: CustomText.secondaryText(
                  text: "Or",
                  color: Color(0xFF9E9E9D),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(height: 1.h, width: 179.w, color: Color(0xFFCBD5E1)),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            labelText: "Email",
            hintText: "Enter You're Email",
            controller: loginController.emailController,
            validator: loginController.emailValidation,
            validation: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 20.h),
          Obx(() {
            return CustomTextField(
              labelText: "Password",
              hintText: "Enter You're Password",
              controller: loginController.passwordController,
              validator: loginController.passwordValidation,
              obscureText: loginController.isPasswordVisible.value,
              validation: AutovalidateMode.onUserInteraction,
              suffixIcon: GestureDetector(
                onTap: () {
                  loginController.togglePasswordVisibility();
                },
                child: Padding(
                  padding:  EdgeInsets.all(10.0.sp),
                  child: Image.asset(
                    loginController.isPasswordVisible.value
                        ? IconsPath.passwordVisibility
                        : IconsPath.passwordVisibility,
                    height: 21.h,
                    width: 21.w,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
