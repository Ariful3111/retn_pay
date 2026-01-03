import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/auth/repositories/check_validity_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class OtpController extends GetxController {
  final CheckValidityRepository checkValidityRepository;
  OtpController({required this.checkValidityRepository});

  TextEditingController emailOTPController = TextEditingController();
  TextEditingController numberOTPController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> verifyOTP(GlobalKey<FormState> fromKey) async {
    int index = Get.find<UserRoleController>().selectedIndex.value;
    if (fromKey.currentState?.validate() ?? false) {
      await checkCodeValidity();
      // if (index == 0) {
      //   Get.toNamed(AppRoutes.mainHome);
      // } else if (index == 1) {
      //   Get.toNamed(AppRoutes.documentVerification);
      // } else if (index == 3) {
      //   Get.toNamed(AppRoutes.documentVerification);
      // } else if (index == 2) {
      //   Get.toNamed(AppRoutes.mainHome);
      // }
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
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        if (data.error == false) {
          SuccessSnackbar.show(description: "OTP verified successfully");
        }
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
