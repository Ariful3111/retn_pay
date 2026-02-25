import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/service_details_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/service_list_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/services_controller.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/submit_property_review_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/submit_property_review_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/service_details_repo.dart';
import 'package:renter_pay/features/dashboard/repositories/service_list_repo.dart';
import 'package:renter_pay/features/rent/controllers/property_review_controller.dart';
import 'package:renter_pay/features/rent/repositories/property_review_repo.dart';

class ServicesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubmitPropertyReviewRepository(postNetwork: Get.find()));
    Get.lazyPut(() => ServiceListRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ServiceDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ServicesController());
    Get.lazyPut(
      () => SubmitPropertyReviewController(
        submitPropertyReviewRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ServiceListController(
        serviceListRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ServiceDetailsController(
        serviceDetailsRepository: Get.find(),
      ),
    );
    if (!Get.isRegistered<PropertyReviewRepository>()) {
      Get.lazyPut(() => PropertyReviewRepository(getNetwork: Get.find()));
    }
    if (!Get.isRegistered<PropertyReviewController>()) {
      Get.lazyPut(
        () => PropertyReviewController(
          propertyReviewRepository: Get.find(),
        ),
      );
    }
  }
}
