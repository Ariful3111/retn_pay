import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/repositories/get_properties_repo.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPropertiesRepository(getNetwork: Get.find()));
    Get.lazyPut(() => HomeController(getPropertiesRepository: Get.find()));
  }
}
