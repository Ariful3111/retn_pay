import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/key_release_controller.dart';

class KeyReleaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KeyReleaseController());
  }
}

