import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/lease_agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/active_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/rent_notice_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/lease_agreement_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/rent_notice_repo.dart';

class ActivePropertiesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivePropertyController());

    if (!Get.isRegistered<RentNoticeRepository>()) {
      Get.lazyPut(() => RentNoticeRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<RentNoticeController>()) {
      Get.lazyPut(() => RentNoticeController(rentNoticeRepository: Get.find()));
    }

    if (!Get.isRegistered<LeaseAgreementRepository>()) {
      Get.lazyPut(() => LeaseAgreementRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<LeaseAgreementController>()) {
      Get.lazyPut(
        () => LeaseAgreementController(leaseAgreementRepository: Get.find()),
      );
    }
  }
}

