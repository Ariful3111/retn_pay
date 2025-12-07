import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(),fenix: true);
  }
}
