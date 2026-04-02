import 'package:get/get.dart';
import 'package:renter_pay/core/services/eway_payment_service.dart';
import 'package:renter_pay/features/profile/models/start_deposit_model.dart';
import 'package:renter_pay/features/profile/repositories/start_deposit_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class StartDepositController extends GetxController {
  final StartDepositRepository startDepositRepository;
  StartDepositController({required this.startDepositRepository});

  final depositDetails = Rxn<StartDepositModel>();
  RxBool isLoading = false.obs;

  Future<void> startDeposit() async {
    isLoading.value = true;
    final response = await startDepositRepository.execute(
      amount: 100,
      currency: 'AUD',
      gateway: 'eway',
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        depositDetails.value = data;
        _handlePaymentGateway(data);
      },
    );
  }

  void _handlePaymentGateway(StartDepositModel data) {
    final formActionUrl = data.data?.formActionUrl;
    if (formActionUrl == null || formActionUrl.isEmpty) {
      ErrorSnackbar.show(description: 'Payment URL not available');
      return;
    }

    EwayPaymentService.launchPaymentGateway(
      paymentUrl: formActionUrl,
      onSuccess: () async {
        await Future.delayed(const Duration(milliseconds: 300));
        SuccessSnackbar.show(description: 'Deposit completed successfully');
      },
      onCancel: () async {
        await Future.delayed(const Duration(milliseconds: 300));
        ErrorSnackbar.show(description: 'Payment was cancelled');
      },
    );
  }
}
