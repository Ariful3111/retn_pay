import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/inspection_form_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_review_controller.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';
import 'package:renter_pay/features/rent/controllers/upload_document_controller.dart';
import 'package:renter_pay/features/rent/repositories/create_inspect_repo.dart';
import 'package:renter_pay/features/rent/repositories/property_details_repo.dart';
import 'package:renter_pay/features/rent/repositories/property_review_repo.dart';
import 'package:renter_pay/features/rent/repositories/upload_document_repo.dart';

class RentDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => PropertyReviewRepository(getNetwork: Get.find()));
    Get.lazyPut(() => UploadDocumentRepository(imageNetwork: Get.find()));
    Get.lazyPut(
      () => CreateInspectionRepository(postWithoutResponse: Get.find()),
    );

    Get.lazyPut(
      () => PropertyViewController(propertyDetailsRepository: Get.find()),
    );
    Get.lazyPut(
      () => UploadDocumentController(uploadDocumentRepository: Get.find()),
    );
    Get.lazyPut(
      () => PropertyReviewController(propertyReviewRepository: Get.find()),
    );
    Get.lazyPut(
      () => InspectionFormController(createInspectionRepository: Get.find()),
    );
  }
}
