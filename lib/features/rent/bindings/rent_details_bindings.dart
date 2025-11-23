import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/rent_details_controller.dart';

class RentDetailsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>RentDetailsController());
  }
} 