import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/services_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/submit_property_review_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/submit_property_review_repo.dart';

class ServicesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServicesController());
    Get.lazyPut(() => SubmitPropertyReviewRepository(postNetwork: Get.find()));
    Get.lazyPut(
      () => SubmitPropertyReviewController(
        submitPropertyReviewRepository: Get.find(),
      ),
    );
  }
}
