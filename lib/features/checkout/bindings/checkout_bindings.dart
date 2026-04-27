import 'package:get/get.dart';
import 'package:renter_pay/features/checkout/controller/start_deposit_controller.dart';
import 'package:renter_pay/features/checkout/controller/withdraw_controller.dart';
import 'package:renter_pay/features/checkout/repositories/start_deposit_repo.dart';
import 'package:renter_pay/features/checkout/repositories/withdraw_repo.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
        Get.lazyPut(() => StartDepositRepository(postWithoutResponse: Get.find()));
        Get.lazyPut(() => WithdrawRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(
      () => StartDepositController(startDepositRepository: Get.find()),
    );
    Get.lazyPut(() => WithdrawController(withdrawRepository: Get.find()));
  }
}
