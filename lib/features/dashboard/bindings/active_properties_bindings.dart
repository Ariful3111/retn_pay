import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/active_property_controller.dart';

class ActivePropertiesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivePropertyController());
  }
}
