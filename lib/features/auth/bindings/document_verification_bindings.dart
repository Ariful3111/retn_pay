import 'package:get/get.dart';
import 'package:renter_pay/features/auth/controllers/document_verification_controller.dart';

class DocumentVerificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentVerificationController());
  }
}
