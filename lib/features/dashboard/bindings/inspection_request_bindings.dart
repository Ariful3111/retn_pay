import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_request_controller.dart';

class InspectionRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InspectionRequestController());
  }
}
