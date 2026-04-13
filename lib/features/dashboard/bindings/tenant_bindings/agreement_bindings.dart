import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_a_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_b_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_c_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_d_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/agreement_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/get_agreements_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/get_agreements_repo.dart';

class AgreementBindings implements Bindings {
  @override
  void dependencies() {
    // Repository
    if (!Get.isRegistered<GetAgreementsRepository>()) {
      Get.lazyPut(() => GetAgreementsRepository(getNetwork: Get.find()));
    }

    // Main agreements controller
    if (!Get.isRegistered<GetAgreementsController>()) {
      Get.lazyPut(
        () => GetAgreementsController(getAgreementsRepository: Get.find()),
      );
    }

    // Agreement part controllers
    Get.lazyPut(() => AgreementController());
    Get.lazyPut(() => AgreementPartAController());
    Get.lazyPut(() => AgreementPartBController());
    Get.lazyPut(() => AgreementPartCController());
    Get.lazyPut(() => AgreementPartDController());
    Get.lazyPut(() => AgreementPartEController());
  }
}
