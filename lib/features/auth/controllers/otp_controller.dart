import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/utils/snackbar.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';

class OtpController extends GetxController {
  TextEditingController emailOTPController = TextEditingController();
  TextEditingController numberOTPController = TextEditingController();

  final emailOTPNode = FocusNode();
  final numberOTPNode = FocusNode();

  RxBool isLoading = false.obs;

  final emailOTPTouch = false.obs;
  final numberOTPTouched = false.obs;

  @override
  void onInit() {
    emailOTPNode.addListener(() {
      if (emailOTPNode.hasFocus) {
        emailOTPTouch.value = true;
      }
    });
    numberOTPNode.addListener(() {
      if (numberOTPNode.hasFocus) {
        numberOTPTouched.value = true;
      }
    });
    super.onInit();
  }
final RegExp otp = RegExp(r'^[0-9]+$');
  String? emailOTPValidation(String? value) {
    final text = (value ?? "").trim();
    if (text.isEmpty) {
      return "Email OTP Is Required";
    }

    if(!otp.hasMatch(text.trim())){
      return 'Enter A Valid OTP';
    }
    return null;
  }

  String? numberOTPValidation(String? value) {
    final text = (value ?? "").trim();
    if (text.isEmpty) {
      return "Email OTP Is Required";
    }
    if(!otp.hasMatch(text.trim())){
      return 'Enter A Valid OTP';
    }
    return null;
  }

  Future<void> verifyOTP(GlobalKey<FormState> fromKey) async {
    int index = Get.find<UserRoleController>().selectedIndex.value;
    emailOTPValidation(emailOTPController.text.trim());
    numberOTPValidation(numberOTPController.text.trim());
    if (fromKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      successSnack(message: "OTP Verification Successful");
      isLoading.value = false;
      if (index == 0) {
        Get.toNamed(AppRoutes.mainHome);
      } else if (index == 1) {
        Get.toNamed(AppRoutes.documentVerification);
      }
      else if(index == 3){
        Get.toNamed(AppRoutes.documentVerification);
      }
      else if(index==2){
        Get.toNamed(AppRoutes.mainHome);
      }
    } else {
      errorSnack(message: "Enter Valid OTP");
      if (index == 0) {
      } else if (index == 1) {
        Get.toNamed(AppRoutes.documentVerification);
      }else if(index == 3){
        Get.toNamed(AppRoutes.documentVerification);
      }
    }
  }
}
