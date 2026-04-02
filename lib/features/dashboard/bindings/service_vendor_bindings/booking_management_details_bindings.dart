import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_search_controller.dart';

class BookingManagementDetailsBindings implements Bindings {
  @override
  void dependencies() {
    // BookingManagementController is provided by ServiceVendorBindings
    // when navigating from BookingManagement view
    Get.lazyPut(() => ServiceSearchController());
    Get.lazyPut(() => ServiceBookedDetailsController());
    Get.lazyPut(
      () => BookingManagementController(getBookingsRepository: Get.find()),
      fenix: true,
    );
  }
}
