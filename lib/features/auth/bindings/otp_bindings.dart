import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/otp_controller.dart';

class OtpBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
