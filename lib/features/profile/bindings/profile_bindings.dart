import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_profile_repo.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProfileRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
  }
}
