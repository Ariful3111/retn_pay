import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/first_onboarding_controller.dart';

class FirstOnboardingBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>FirstOnboardingController());
  }
}