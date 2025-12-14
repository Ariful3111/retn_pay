import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_request_controller.dart';

class RepairRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepairRequestController());
  }
}
