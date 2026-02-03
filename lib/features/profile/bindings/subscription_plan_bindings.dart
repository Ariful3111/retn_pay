import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/plan_controller.dart';
import 'package:renter_pay/features/profile/controllers/subscribe_plan_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_plan_repo.dart';
import 'package:renter_pay/features/profile/repositories/subscribe_plan_repo.dart';

class SubscriptionPlanBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PlanRepository>()) {
      Get.lazyPut(() => PlanRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PlanController>()) {
      Get.lazyPut(() => PlanController(planRepository: Get.find()));
    }
    if (!Get.isRegistered<SubscribePlanRepository>()) {
      Get.lazyPut(
        () => SubscribePlanRepository(postWithoutResponse: Get.find()),
      );
    }
    if (!Get.isRegistered<SubscribePlanController>()) {
      Get.lazyPut(
        () => SubscribePlanController(subscribePlanRepository: Get.find()),
      );
    }
  }
}
