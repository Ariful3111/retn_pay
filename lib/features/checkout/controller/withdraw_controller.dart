import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/checkout/controller/balance_controller.dart';
import 'package:renter_pay/features/checkout/repositories/withdraw_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class WithdrawController extends GetxController {
  final WithdrawRepository withdrawRepository;
  WithdrawController({required this.withdrawRepository});
  TextEditingController withdrawController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> withdraw() async {
    isLoading.value = true;
    double withdrawAmount = double.tryParse(withdrawController.text) ?? 0.0;
    final response = await withdrawRepository.execute(
      amount: withdrawAmount,
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
