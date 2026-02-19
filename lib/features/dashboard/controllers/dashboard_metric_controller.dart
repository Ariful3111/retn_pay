import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/dashboard_metric_model.dart';
import 'package:renter_pay/features/dashboard/repositories/dashboard_metrics_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class DashboardMetricController extends GetxController {
  final DashboardMetricsRepository dashboardMetricsRepository;
  DashboardMetricController({required this.dashboardMetricsRepository});

  final dashboardMetric = Rxn<DashboardMetricModel>();
  RxBool isLoading = true.obs;

  Future<void> getDashboardMetric({String? fromDate, String? toDate}) async {
    isLoading.value = true;
    final response = await dashboardMetricsRepository.execute(
        fromDate: fromDate, toDate: toDate);
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        dashboardMetric.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getDashboardMetric();
  }
}
