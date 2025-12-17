import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_booked_controller.dart';

class ServiceBookedBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceBookedController());
  }
}
