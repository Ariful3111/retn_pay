import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/plan_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_plan_repo.dart';

class ProfileEditBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ProfileEditController());
    Get.lazyPut(() => PlanController(planRepository: Get.find()));
  }
}
