import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';

class PaymentManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentManagementController());
  }
}
