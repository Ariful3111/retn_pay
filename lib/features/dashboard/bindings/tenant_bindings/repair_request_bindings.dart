import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/repair_maintenance_details_repo.dart';

class RepairRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RepairMaintenanceDetailsRepository(getNetwork: Get.find()),
    );
    Get.lazyPut(
      () => RepairRequestController(
        repairMaintenanceDetailsRepository: Get.find(),
      ),
    );
  }
}
