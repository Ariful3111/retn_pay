import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_part_e_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/application_details_repo.dart';

class ApplicationManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => ApplicationManagementDetailsController(
        applicationDetailsRepository: Get.find(),
      ),
    );
    Get.lazyPut(() => ApplicationManagementDetailsTableController());
    Get.lazyPut(() => ApplicationManagementDetailsPartEController());
  }
}
