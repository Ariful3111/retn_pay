import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_details_table_controller.dart';

class ApplicationManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationManagementDetailsController());
    Get.lazyPut(() => ApplicationManagementDetailsTableController());
  }
}