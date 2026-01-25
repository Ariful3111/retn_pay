import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/features/home/repositories/get_properties_repo.dart';
import 'package:renter_pay/features/home/repositories/recommended_repo.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPropertiesRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetRecommendedRepository(getNetwork: Get.find()));
    Get.lazyPut(() => HomeController(getPropertiesRepository: Get.find()));
    Get.lazyPut(
      () => RecommendedController(getRecommendedRepository: Get.find()),
    );
  }
}
