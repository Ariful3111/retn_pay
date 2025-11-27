import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/profile_edit_controller.dart';

class ProfileEditBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProfileEditController());
  }
}