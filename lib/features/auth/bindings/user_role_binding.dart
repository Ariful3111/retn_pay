import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';

class UserRoleBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UserRoleController());
  }
}