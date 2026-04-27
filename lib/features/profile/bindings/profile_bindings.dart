import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/logout_controller.dart';
import 'package:renter_pay/features/auth/repositories/logout_repo.dart';
import 'package:renter_pay/features/checkout/controller/balance_controller.dart';
import 'package:renter_pay/features/profile/controllers/privacy_controller.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_balance_repo.dart';
import 'package:renter_pay/features/profile/repositories/get_profile_repo.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.lazyPut(() => GetProfileRepository(getNetwork: Get.find()));
    Get.lazyPut(() => LogoutRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => GetBalanceRepository(getNetwork: Get.find()));

    // Controllers
    Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
    Get.lazyPut(() => LogoutController(logoutRepository: Get.find()));
    Get.lazyPut(() => PrivacyController());
    Get.lazyPut(() => BalanceController(getBalanceRepository: Get.find()));
  }
}
