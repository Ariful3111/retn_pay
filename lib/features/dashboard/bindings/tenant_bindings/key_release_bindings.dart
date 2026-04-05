import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/bindings/tenant_bindings/agreement_bindings.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/key_release_controller.dart';

class KeyReleaseBindings implements Bindings {
  @override
  void dependencies() {
    // Load agreement bindings first (includes GetAgreementsController)
    AgreementBindings().dependencies();

    // Load key release controller
    Get.lazyPut(() => KeyReleaseController());
  }
}
