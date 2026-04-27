import 'package:get/get.dart';
import 'package:renter_pay/features/profile/models/balance_model.dart';
import 'package:renter_pay/features/profile/repositories/get_balance_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class BalanceController extends GetxController {
  final GetBalanceRepository getBalanceRepository;
  BalanceController({required this.getBalanceRepository});

  final balance = Rxn<BalanceModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBalance();
  }

  Future<void> getBalance() async {
    isLoading.value = true;
    final response = await getBalanceRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        balance.value = data;
      },
    );
  }
}
