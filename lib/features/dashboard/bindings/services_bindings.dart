import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_controller.dart';

class ServicesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServicesController());
  }
}
