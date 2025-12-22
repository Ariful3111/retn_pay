import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/forgot_password_controller.dart';

class ForgotPasswordBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
