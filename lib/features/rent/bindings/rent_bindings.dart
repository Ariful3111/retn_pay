import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';

class RentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RentController());
  }
}
