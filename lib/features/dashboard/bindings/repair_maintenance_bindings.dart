import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/repair_maintenance_controller.dart';

class RepairMaintenanceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepairMaintenanceController());
    }
}
