import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';
import 'package:renter_pay/features/auth/repositories/verification_repo.dart';

class SignupViewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => SignupController(verificationRepository: Get.find()));
  }
}
