import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/colors.dart';
import 'package:renter_pay/features/auth/controllers/forgot_password_controller.dart';
import 'package:renter_pay/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:renter_pay/shared/widgets/custom_fields/custom_text_field.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_secondary.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ForgotPasswordController forgotPasswordController = Get.find();
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(20.r),
        width: 360.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkPrimary : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextPrimary(text: 'Forget Password', fontSize: 24.sp),
              SizedBox(height: 10.h),
              CustomTextSecondary(text: 'Recover your account password'),
              SizedBox(height: 40.h),
              CustomTextField(controller: forgotPasswordController.emailController,labelText: 'Email',),
              SizedBox(height: 40.h),
              CustomPrimaryButton(
                height: 40.h,
                width: 150.w,
                borderRadius: BorderRadius.circular(6.r),
                text: 'Send Link',
                onPressed: () {
                
              },)
            ],
          ),
        ),
      ),
    );
  }
}
