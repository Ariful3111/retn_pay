import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/auth/controllers/otp_controller.dart';
import 'package:renter_pay/shared/extensions/Validators/otp_validator.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/loadings/button_loading.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final fromKey = GlobalKey<FormState>();
    return Form(
      key: fromKey,
      child: CustomContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesPath.appLogo, height: 30.h, width: 170.w),
              SizedBox(height: 21.h),
              CustomTextPrimary(text: "Verify Your Account", fontSize: 28.sp),
              SizedBox(height: 7.h),
              CustomTextPrimary(
                text: "Enter the otp send to your email and phone number",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 21.h),
              // Show email OTP field if email was provided or both
              if (Get.arguments.toString() == "email" ||
                  Get.arguments.toString() == "both")
                Column(
                  children: [
                    CustomTextField(
                      labelText: "Verify Email OTP",
                      hintText: "Enter Email OTP",
                      controller: controller.emailOTPController,
                      validator: otpValidation,
                      keyboardType: TextInputType.number,
                      validation: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 21.h),
                  ],
                ),
              // Show phone OTP field if phone was provided or both
              if (Get.arguments.toString() == "phone" ||
                  Get.arguments.toString() == "both")
                Column(
                  children: [
                    CustomTextField(
                      labelText: "Verify Phone Number OTP",
                      hintText: "Enter Phone Number OTP",
                      controller: controller.numberOTPController,
                      validator: otpValidation,
                      keyboardType: TextInputType.number,
                      validation: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 21.h),
                  ],
                ),
              Obx(() {
                return controller.isLoading.value
                    ? ButtonLoading()
                    : CustomPrimaryButton(
                        height: 48.50.h,
                        onPressed: () async {
                          await controller.verifyOTP(fromKey);
                        },
                        text: "Verify OTP",
                        textColor: AppColors.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
