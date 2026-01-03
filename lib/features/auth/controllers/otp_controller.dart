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
    final (contact, contactType, message) = Get.find<SignupController>()
        .verificationIdentifier();
    final response = await checkValidityRepository.execute(
      contact: contact,
      code: codeIdentifier(),
    );
    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        if (data.error == false) {
          await signupController.register(
            phoneCode: numberOTPController.text,
            emailCode: emailOTPController.text,
          );
        }
        isLoading.value = false;
      },
    );
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
