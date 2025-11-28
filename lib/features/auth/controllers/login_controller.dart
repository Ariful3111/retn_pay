// ignore_for_file: unused_element
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxBool isRemember = false.obs;

  final emailTouched = false.obs;
  final passwordTouched = false.obs;

  void toggleRemember(bool? value) {
    isRemember.value = value ?? true;
  }
  String? emailValidation(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) {
      return "Email is required";
    }
    // ignore: deprecated_member_use
    final RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailReg.hasMatch(text)) {
      return null;
    }
    {
      return "Enter a valid email address";
    }
  }

  String? passwordValidation(String? value) {
    final text = (value ?? '').trim();

    if (text.isEmpty) {
      return "Password is required";
    }
    if (text.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  Future<void> userLogin(GlobalKey<FormState> formKey) async {
    emailValidation(emailController.text.trim());
    passwordValidation(passwordController.text.trim());
    int index = Get.find<UserRoleController>().selectedIndex.value;
     Get.toNamed(AppRoutes.mainHome);
    if (formKey.currentState?.validate() ?? false) {
      Get.toNamed(AppRoutes.mainHome);
      if(index==2){
        Get.toNamed(AppRoutes.mainHome);
      }
    } else {
      if(index==2){
        Get.toNamed(AppRoutes.mainHome);
      }
    }
  }

  void signup(fromKey) {
    emailController.clear();
    passwordController.clear();
    fromKey.currentState?.reset();
    Get.toNamed(AppRoutes.signupView);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
