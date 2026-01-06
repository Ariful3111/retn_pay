import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';

class ServiceBookedDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceBookedDetailsController());
  }
}
