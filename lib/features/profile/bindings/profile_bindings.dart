import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
