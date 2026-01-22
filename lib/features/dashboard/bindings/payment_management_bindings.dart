import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/rent_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';

class PaymentManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentManagementController());
    Get.lazyPut(() => RentManagementController());
    Get.lazyPut(() => ServicePaymentManagementController());
  }
}
