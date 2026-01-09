import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/inspection_from_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/features/rent/repositories/property_details_repo.dart';

class RentDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => PropertyViewController(propertyDetailsRepository: Get.find()),
    );
    Get.lazyPut(() => InspectionFromController());
  }
}
