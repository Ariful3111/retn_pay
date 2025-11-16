import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/onboarding_controller.dart';

class OnboardingBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(),fenix: true);
  }
}