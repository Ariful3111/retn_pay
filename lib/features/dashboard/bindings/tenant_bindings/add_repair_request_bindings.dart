import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';

class AddRepairRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddRepairRequestController());
  }
}

