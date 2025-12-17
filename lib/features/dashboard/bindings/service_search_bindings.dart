import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_search_controller.dart';

class ServiceSearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceSearchController());
  }
}
