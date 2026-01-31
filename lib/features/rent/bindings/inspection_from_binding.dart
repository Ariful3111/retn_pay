import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/inspection_form_controller.dart';
import 'package:renter_pay/features/rent/controllers/upload_document_controller.dart';
import 'package:renter_pay/features/rent/controllers/faq_controller.dart';
import 'package:renter_pay/features/rent/repositories/create_inspect_repo.dart';
import 'package:renter_pay/features/rent/repositories/upload_document_repo.dart';
import 'package:renter_pay/features/rent/repositories/faq_repo.dart';

class InspectionFromBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateInspectionRepository>(
      () => CreateInspectionRepository(postWithoutResponse: Get.find()),
    );
    Get.lazyPut<InspectionFormController>(
      () => InspectionFormController(createInspectionRepository: Get.find()),
    );
    Get.lazyPut<UploadDocumentRepository>(
      () => UploadDocumentRepository(imageNetwork: Get.find()),
    );
    Get.lazyPut<UploadDocumentController>(
      () => UploadDocumentController(uploadDocumentRepository: Get.find()),
    );
    Get.lazyPut<FAQRepository>(() => FAQRepository(getNetwork: Get.find()));
    Get.lazyPut<FAQController>(() => FAQController(faqRepository: Get.find()));
  }
}
