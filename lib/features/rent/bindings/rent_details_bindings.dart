import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/property_view_controller.dart';

class RentDetailsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PropertyViewController());
  }
} 