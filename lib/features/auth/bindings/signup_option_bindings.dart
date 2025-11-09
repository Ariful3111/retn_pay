import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_option_controller.dart';

class SignupOptionBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignupOptionController());
  }
}