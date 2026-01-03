import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/otp_controller.dart';
import 'package:renter_pay/features/auth/repositories/check_validity_repo.dart';

class OtpBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckValidityRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => OtpController(checkValidityRepository: Get.find()));
  }
}
