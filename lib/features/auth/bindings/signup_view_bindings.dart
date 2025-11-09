import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/signup_controller.dart';

class SignupViewBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignupController());
  }
}