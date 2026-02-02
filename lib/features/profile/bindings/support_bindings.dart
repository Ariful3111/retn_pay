import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/features/rent/repositories/faq_repo.dart';

class SupportBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAQRepository(getNetwork: Get.find()));
    Get.lazyPut(() => SupportController());
    Get.lazyPut(() => FAQController(faqRepository: Get.find()));
  }
}
