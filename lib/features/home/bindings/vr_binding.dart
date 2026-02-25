import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/vr_controller.dart';

class VRBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VrController());
  }
}
