import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';
import 'package:renter_pay/features/profile/repositories/add_support_repo.dart';
import 'package:renter_pay/features/profile/repositories/get_support_repo.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/features/rent/repositories/faq_repo.dart';

class SupportBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetSupportTicketRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => AddSupportTicketRepository(imageWithoutResponse: Get.find()),
    );
    Get.lazyPut(
      () => SupportController(
        getSupportTicketRepository: Get.find(),
        addSupportTicketRepository: Get.find(),
      ),
    );
    Get.lazyPut(() => FAQRepository(getNetwork: Get.find()));
    Get.lazyPut(() => FAQController(faqRepository: Get.find()));
  }
}
