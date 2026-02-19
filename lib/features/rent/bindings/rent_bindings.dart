import 'package:get/get.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
import 'package:renter_pay/features/rent/repositories/rent_list_repo.dart';

class RentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetRentListRepository(getNetwork: Get.find()));
    Get.lazyPut(() => RentController(getRentListRepository: Get.find()));
  }
}
