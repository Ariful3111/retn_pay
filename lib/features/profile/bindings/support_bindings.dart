import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/support_controller.dart';

class SupportBindings implements Bindings{
  @override
  void dependencies() {
Get.lazyPut(()=>SupportController());  }
}