import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/main_home_controller.dart';

class MainHomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainHomeController());
  }
}
