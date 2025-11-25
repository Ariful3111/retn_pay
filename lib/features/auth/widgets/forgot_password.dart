import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/login_controller.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_text_primary.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Obx(() {
            return Row(
              children: [
                Checkbox(
                  value: loginController.isRemember.value,
                  onChanged: (value) {
                    loginController.toggleRemember(value);
                  },
                ),
                CustomTextPrimary(
                  text: "Remember Me",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 10.w),
                Spacer(),
                GestureDetector(
                  onTap: (){},
                  child:CustomTextPrimary(
                    text: "Forgot Password",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          });
  }
}