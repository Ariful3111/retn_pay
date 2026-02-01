import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/get_inspections_repo.dart';

class InspectionRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetInspectionsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => InspectionRequestController(getInspectionsRepository: Get.find()),
    );
    Get.lazyPut(() => LandlordInspectionRequestController());
  }
}
