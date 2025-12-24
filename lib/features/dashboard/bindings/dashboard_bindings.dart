import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_landlord_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => DashboardLandlordController());
  }
}
