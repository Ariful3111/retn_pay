import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';
import 'package:renter_pay/features/rent/repositories/upload_document_repo.dart';

class DocumentVerificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadDocumentRepository(imageNetwork: Get.find()));
    Get.lazyPut(
      () =>
          DocumentVerificationController(uploadDocumentRepository: Get.find()),
    );
  }
}
