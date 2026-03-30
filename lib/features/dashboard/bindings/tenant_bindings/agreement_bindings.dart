import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';

class AgreementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgreementController());
    Get.lazyPut(() => AgreementPartAController());
  }
}
