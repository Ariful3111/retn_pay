import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  final emailTouched = false.obs;
  final passwordTouched = false.obs;
  final confirmPasswordTouched = false.obs;
  final nameTouched = false.obs;
  final phoneTouched = false.obs;

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

  String? phoneValidation(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) {
      return "Phone number is required";
    }
    // ignore: deprecated_member_use
    final RegExp phoneReg = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
    if (phoneReg.hasMatch(text)) {
      return null;
    }
    return "Enter a valid phone number";
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

  String? confirmPasswordValidation(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) {
      return "Confirm Password is required";
    }
    if (text != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? nameValidation(String? value) {
    final text = (value ?? '');
    if (text.isEmpty) {
      return "Name is required";
    }
    if (text.length < 3) {
      return "Name must be at least 3 characters";
    }
    // ignore: deprecated_member_use
    final RegExp name = RegExp(r"^[A-za-z]+(?: [A-za-z]*)?$");
    if (!name.hasMatch(text)) {
      return 'You can\'t use number or special character';
    }
    return null;
  }

  void userSignup(GlobalKey<FormState> fromKey) async {
    nameValidation(nameController.text);
    emailValidation(emailController.text.trim());
    phoneValidation(phoneController.text.trim());
    passwordValidation(passwordController.text.trim());
    confirmPasswordValidation(confirmPassController.text.trim());
    Get.toNamed(AppRoutes.otpView);
    if (fromKey.currentState?.validate() ?? false) {}
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void login(fromKey) {
    confirmPassController.clear();
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneController.clear();
    fromKey.currentState?.reset();
    Get.toNamed(AppRoutes.loginView);
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
