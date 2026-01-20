import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/landlord_controller/landlord_key_release_controller.dart';

class LandlordKeyReleaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandlordKeyReleaseController());
  }
}
