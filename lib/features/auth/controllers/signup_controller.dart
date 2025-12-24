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

  void userSignup({required GlobalKey<FormState> fromKey}) async {
    if (fromKey.currentState?.validate() ?? false) {
      Get.toNamed(AppRoutes.otpView);
    }
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
