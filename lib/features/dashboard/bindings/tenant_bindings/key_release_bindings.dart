import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/agreement_bindings.dart';
import 'package:renter_pay/features/dashboard/controllers/key_release_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/key_release_request_repo.dart';

class KeyReleaseBindings implements Bindings {
  @override
  void dependencies() {
    // Load agreement bindings first (includes GetAgreementsController)
    AgreementBindings().dependencies();

    // Key Release Request Repository
    if (!Get.isRegistered<KeyReleaseRequestRepository>()) {
      Get.lazyPut(
        () => KeyReleaseRequestRepository(
          imageNetwork: Get.find(),
          postNetwork: Get.find(),
        ),
      );
    }

    // Key Release Request Controller
    if (!Get.isRegistered<KeyReleaseRequestController>()) {
      Get.lazyPut(() => KeyReleaseRequestController(repository: Get.find()));
    }
  }
}
