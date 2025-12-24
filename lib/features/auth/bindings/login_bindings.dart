import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/login_controller.dart';
import 'package:renter_pay/features/auth/repositories/login_repo.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => LoginController(loginRepository: Get.find()));
  }
}
