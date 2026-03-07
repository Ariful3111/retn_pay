import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/add_repair_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/lease_agreement_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/add_repair_request_repo.dart';

class AddRepairRequestBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<LeaseAgreementRepository>()) {
      Get.lazyPut(() => LeaseAgreementRepository(getNetwork: Get.find()));
    }
    Get.lazyPut(() => AddRepairRequestRepository(imageNetwork: Get.find()));
    Get.lazyPut(
      () => AddRepairRequestController(addRepairRequestRepository: Get.find()),
    );
    if (!Get.isRegistered<LeaseAgreementController>()) {
      Get.lazyPut(
        () => LeaseAgreementController(leaseAgreementRepository: Get.find()),
      );
    }
  }
}
