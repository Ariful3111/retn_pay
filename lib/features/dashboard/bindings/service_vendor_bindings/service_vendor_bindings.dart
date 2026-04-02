import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_payment_management_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/get_bookings_repo.dart';

class ServiceVendorBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<GetBookingsRepository>()) {
      Get.lazyPut(
        () => GetBookingsRepository(getNetwork: Get.find()),
        fenix: true,
      );
    }
    if (!Get.isRegistered<BookingManagementController>()) {
      Get.lazyPut(
        () => BookingManagementController(getBookingsRepository: Get.find()),
        fenix: true,
      );
    }
    Get.lazyPut(() => ServicePaymentManagementController());
    Get.lazyPut(() => ServiceManagementController());
  }
}
