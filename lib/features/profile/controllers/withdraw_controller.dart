import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/balance_controller.dart';
import 'package:renter_pay/features/profile/repositories/withdraw_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class WithdrawController extends GetxController {
  final WithdrawRepository withdrawRepository;
  WithdrawController({required this.withdrawRepository});

  RxBool isLoading = false.obs;

  Future<void> withdraw() async {
    isLoading.value = true;
    final response = await withdrawRepository.execute(
      amount: 50,
      currency: 'AUD',
      paymentMethod: 1,
    );

    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        await Get.find<BalanceController>().getBalance();
        isLoading.value = false;
        SuccessSnackbar.show(description: "Withdrawal completed successfully");
      },
    );
  }
}
