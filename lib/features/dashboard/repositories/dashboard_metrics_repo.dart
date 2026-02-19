import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/dashboard_metric_model.dart';

class DashboardMetricsRepository {
  final GetNetwork getNetwork;
  const DashboardMetricsRepository({required this.getNetwork});

  Future<Either<ErrorModel, DashboardMetricModel>> execute({
    String? fromDate,
    String? toDate,
  }) async {
    final response = await getNetwork.getData<DashboardMetricModel>(
      url:
          "/api/${NetworkLinks.version}/dashboard/metrics?from_date=${fromDate ?? ''}&to_date=${toDate ?? ''}",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => DashboardMetricModel.fromJson(json),
    );
    return response;
  }
}
