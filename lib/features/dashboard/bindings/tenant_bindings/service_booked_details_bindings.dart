import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/update_booking_status_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/update_booking_status_repo.dart';

class ServiceBookedDetailsBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<UpdateBookingStatusRepository>()) {
      Get.lazyPut(
        () => UpdateBookingStatusRepository(updateWithoutResponse: Get.find()),
        fenix: true,
      );
    }
    if (!Get.isRegistered<UpdateServiceStatusController>()) {
      Get.lazyPut(
        () => UpdateServiceStatusController(
          updateBookingStatusRepository: Get.find(),
        ),
        fenix: true,
      );
    }
    Get.lazyPut(() => ServiceBookedDetailsController());
  }
}
