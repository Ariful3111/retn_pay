import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/service_booked_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/booked_list_repo.dart';

class ServiceBookedBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookedListRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => ServiceBookedController(bookedListRepository: Get.find()),
    );
  }
}
