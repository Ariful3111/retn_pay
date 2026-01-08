import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/add_new_property_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/application_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_calender_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/dashboard_landlord_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/property_management_details_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DashboardLandlordController());
    Get.lazyPut(() => PropertyManagementController());
    Get.lazyPut(() => AddNewPropertyController());
    Get.lazyPut(() => PropertyManagementDetailsController());
    Get.lazyPut(() => ApplicationManagementController());
    Get.lazyPut(() => LandlordCalenderController());
  }
}
