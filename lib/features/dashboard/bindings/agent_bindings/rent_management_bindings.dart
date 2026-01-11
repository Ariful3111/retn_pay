import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/rent_management_controller.dart';

class RentManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RentManagementController());
  }
}
