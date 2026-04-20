import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/update_repair_status_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/repair_maintenance_details_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/update_repair_request_repo.dart';

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

    // Update Repair Request Repository
    if (!Get.isRegistered<UpdateRepairRequestRepository>()) {
      Get.lazyPut(
        () => UpdateRepairRequestRepository(postWithoutResponse: Get.find()),
      );
    }

    // Update Repair Request Controller
    if (!Get.isRegistered<UpdateRepairRequestController>()) {
      Get.lazyPut(
        () => UpdateRepairRequestController(
          updateRepairRequestRepository: Get.find(),
        ),
      );
    }
  }
}
