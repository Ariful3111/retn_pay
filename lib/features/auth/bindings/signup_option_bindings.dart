import 'package:get/get.dart';
import 'package:renter_pay/core/services/google_auth_service.dart';
import 'package:renter_pay/features/auth/controllers/signup_option_controller.dart';
import 'package:renter_pay/features/auth/controllers/social_login_controller.dart';
import 'package:renter_pay/features/auth/repositories/social_login_repo.dart';

class SignupOptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupOptionController());
    Get.lazyPut(() => GoogleAuthService());
    Get.lazyPut(() => SocialLoginRepository(postNetwork: Get.find()));
    Get.lazyPut(
      () => SocialLoginController(
        socialLoginRepository: Get.find(),
        googleAuthService: Get.find(),
      ),
    );
  }
}
