import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';

class InspectionRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InspectionRequestController());
    Get.lazyPut(() => LandlordInspectionRequestController());
  }
}
