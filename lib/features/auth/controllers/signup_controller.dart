import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/repositories/verification_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class SignupController extends GetxController {
  final VerificationRepository verificationRepository;
  SignupController({required this.verificationRepository});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  Future<void> sendCode({required GlobalKey<FormState> fromKey}) async {
    if (fromKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final (contact, contactType, message) = verificationIdentifier();
      final response = await verificationRepository.execute(
        contact: contact,
        contactType: contactType,
        isRegistration: 1,
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          SuccessSnackbar.show(description: message);
          Get.toNamed(AppRoutes.otpView, arguments: contactType);
        },
      );
    }
  }


  

  (String, String, String) verificationIdentifier() {
    if (phoneController.text.isNotEmpty) {
      return (phoneController.text, "phone", "Code sended to your phone");
    } else if (emailController.text.isNotEmpty) {
      return (emailController.text, "email", "Code sended to your email");
    } else {
      return ("", "", "");
    }
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
