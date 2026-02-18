import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/repair_maintenance_repo.dart';

class RepairMaintenanceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepairMaintenanceRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () =>
          RepairMaintenanceController(repairMaintenanceRepository: Get.find()),
    );
    Get.lazyPut(() => LandlordRepairMaintenanceController());
  }
}
