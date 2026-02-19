import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/repair_maintenance_model.dart';

class RepairMaintenanceRepository {
  final GetNetwork getNetwork;
  const RepairMaintenanceRepository({required this.getNetwork});

  Future<Either<ErrorModel, RepairMaintenanceModel>> execute({
    String? status,
  }) async {
    final queryStatus =
        (status == null || status.trim().isEmpty) ? '' : '?status=$status';
    final response = await getNetwork.getData<RepairMaintenanceModel>(
      url: "/api/${NetworkLinks.version}/maintenance/requests$queryStatus",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => RepairMaintenanceModel.fromJson(json),
    );
    return response;
  }
}
