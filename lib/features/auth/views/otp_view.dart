import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/core/constants/images_path.dart';
import 'package:renter_pay/features/auth/controllers/otp_controller.dart';
import 'package:renter_pay/shared/widgets/custom_container.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.find();
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
              CustomTextField(
                labelText: "Verify Email OTP",
                hintText: "Enter Email OTP",
                controller: otpController.emailOTPController,
                validator: otpController.emailOTPValidation,
                keyboardType: TextInputType.number,
                validation: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 21.h),
              CustomTextField(
                labelText: "Verify Phone Number OTP",
                hintText: "Enter Phone Number OTP",
                controller: otpController.numberOTPController,
                validator: otpController.numberOTPValidation,
                keyboardType: TextInputType.number,
                validation: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 21.h),
              CustomPrimaryButton(
                height: 48.50.h,
                onPressed: () {
                  otpController.verifyOTP(fromKey);
                },
                text: "Signup",
                textColor: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
