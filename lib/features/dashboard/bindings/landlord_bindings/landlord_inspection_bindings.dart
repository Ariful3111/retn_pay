import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/inspection_update_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/inspection_details_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/inspection_details_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/update_inspection_repo.dart';

class LandlordInspectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetInspectionDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => InspectionDetailsController(
        getInspectionDetailsRepository: Get.find(),
      ),
    );
    Get.lazyPut(() => UpdateInspectionRepository(updateNetwork: Get.find()));
    Get.lazyPut(
      () => InspectionUpdateController(updateInspectionRepository: Get.find()),
    );
  }
}
