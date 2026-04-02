import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/features/auth/repositories/check_validity_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class OtpController extends GetxController {
  final CheckValidityRepository checkValidityRepository;
  OtpController({required this.checkValidityRepository});

  final signupController = Get.find<SignupController>();

  TextEditingController emailOTPController = TextEditingController();
  TextEditingController numberOTPController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> verifyOTP(GlobalKey<FormState> fromKey) async {
    if (fromKey.currentState?.validate() ?? false) {
      await checkCodeValidity();
    }
  }

  Future<void> checkCodeValidity() async {
    isLoading.value = true;

    // Verify phone OTP if provided
    if (numberOTPController.text.isNotEmpty) {
      final phoneContact = Get.find<SignupController>().phoneController.text;
      final phoneResponse = await checkValidityRepository.execute(
        contact: phoneContact,
        code: numberOTPController.text,
      );
      await phoneResponse.fold(
        (error) async {
          isLoading.value = false;
          ErrorSnackbar.show(
            description: 'Phone verification failed: ${error.message}',
          );
          return false;
        },
        (data) async {
          if (data.error != false) {
            isLoading.value = false;
            ErrorSnackbar.show(description: 'Phone verification failed');
            return false;
          }
          return true;
        },
      );
    }

    // Verify email OTP if provided
    if (emailOTPController.text.isNotEmpty) {
      final emailContact = Get.find<SignupController>().emailController.text;
      final emailResponse = await checkValidityRepository.execute(
        contact: emailContact,
        code: emailOTPController.text,
      );
      await emailResponse.fold(
        (error) async {
          isLoading.value = false;
          ErrorSnackbar.show(
            description: 'Email verification failed: ${error.message}',
          );
          return false;
        },
        (data) async {
          if (data.error != false) {
            isLoading.value = false;
            ErrorSnackbar.show(description: 'Email verification failed');
            return false;
          }
          return true;
        },
      );
    }

    // If we reach here, both verifications passed
    await signupController.register(
      phoneCode: numberOTPController.text,
      emailCode: emailOTPController.text,
    );
    isLoading.value = false;
  }

  String codeIdentifier() {
    String otpType = Get.arguments.toString();
    if (otpType == "email") {
      return emailOTPController.text;
    } else {
      return numberOTPController.text;
    }
  }
}
