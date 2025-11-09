import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController);
  }
}
