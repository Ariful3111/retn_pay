import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/monthly_revenue_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/monthly_revenue_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class MonthlyRevenueController extends GetxController {
  final GetMonthlyRevenueRepository getMonthlyRevenueRepository;
  MonthlyRevenueController({required this.getMonthlyRevenueRepository});

  final monthlyRevenue = Rxn<MonthlyRevenueModel>();
  RxBool isLoading = true.obs;

  Future<void> getMonthlyRevenue() async {
    final response = await getMonthlyRevenueRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        monthlyRevenue.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getMonthlyRevenue();
  }
}
