import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/booking_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/services_vendor_controller/service_payment_management_controller.dart';

class ServiceVendorBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceManagementController());
    Get.lazyPut(() => BookingManagementController());
    Get.lazyPut(() => ServicePaymentManagementController());
  }
}
