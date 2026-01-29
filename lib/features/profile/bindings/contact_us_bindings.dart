import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/contact_us_controller.dart';
import 'package:renter_pay/features/profile/repositories/contact_us_repo.dart';

class ContactUsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => ContactUsController(contactUsRepository: Get.find()));
  }
}
