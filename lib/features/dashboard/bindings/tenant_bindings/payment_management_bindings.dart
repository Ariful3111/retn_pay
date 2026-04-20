import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/agent_controller/rent_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/upcoming_payment_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/upcoming_payment_repo.dart';

class PaymentManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentManagementController());
    Get.lazyPut(() => RentManagementController());
    Get.lazyPut(() => ServicePaymentManagementController());

    // Upcoming Payment Repository
    if (!Get.isRegistered<UpcomingPaymentRepository>()) {
      Get.lazyPut(() => UpcomingPaymentRepository(getNetwork: Get.find()));
    }

    // Upcoming Payment Controller
    if (!Get.isRegistered<UpcomingPaymentController>()) {
      Get.lazyPut(
        () => UpcomingPaymentController(upcomingPaymentRepository: Get.find()),
      );
    }
  }
}
