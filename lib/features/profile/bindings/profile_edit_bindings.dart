import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/home/repositories/property_address_repo.dart';
import 'package:renter_pay/features/profile/controllers/get_preference_controller.dart';
import 'package:renter_pay/features/profile/controllers/plan_controller.dart';
import 'package:renter_pay/features/profile/controllers/preference_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';
import 'package:renter_pay/features/profile/controllers/subscribe_plan_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_plan_repo.dart';
import 'package:renter_pay/features/profile/repositories/get_preference_repo.dart';
import 'package:renter_pay/features/profile/repositories/profile_edit_repo.dart';
import 'package:renter_pay/features/profile/repositories/subscribe_plan_repo.dart';
import 'package:renter_pay/features/profile/repositories/update_preference_repo.dart';

class ProfileEditBindings implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<PropertyAddressRepository>()) {
      Get.lazyPut(() => PropertyAddressRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PropertyAddressController>()) {
      Get.lazyPut(
        () => PropertyAddressController(propertyAddressRepository: Get.find()),
      );
    }
    Get.lazyPut(() => PlanRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ProfileEditRepository(patchWithoutResponse: Get.find()));
    Get.lazyPut(
      () => UpdatePreferenceRepository(postWithoutResponse: Get.find()),
    );
    Get.lazyPut(() => GetPreferenceRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PlanController(planRepository: Get.find()));
    Get.lazyPut(() => ProfileEditController(profileEditRepository: Get.find()));
    Get.lazyPut(
      () => PreferenceController(updatePreferenceRepository: Get.find()),
    );
    Get.lazyPut(
      () => GetPreferenceController(getPreferenceRepository: Get.find()),
    );
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
