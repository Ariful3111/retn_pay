// ignore_for_file: unused_element
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/repositories/login_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController({required this.loginRepository});
  final StorageService storageService = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxBool isRemember = false.obs;

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

  Future<void> userLogin({required GlobalKey<FormState> formKey}) async {
    emailValidation(emailController.text.trim());
    passwordValidation(passwordController.text.trim());
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final response = await loginRepository.execute(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) async {
          await storageService.write(
            key: storageService.tokenKey,
            value: data.data!.token.toString(),
          );
          Get.toNamed(AppRoutes.mainHome);
        },
      );
    }
  }

  void signup({required GlobalKey<FormState> formKey}) {
    emailController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
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
