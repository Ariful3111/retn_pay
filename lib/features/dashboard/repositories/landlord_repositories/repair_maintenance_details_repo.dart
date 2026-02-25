import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/repair_maintenance_details_model.dart';

class RepairMaintenanceDetailsRepository {
  final GetNetwork getNetwork;
  const RepairMaintenanceDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, RepairMaintenanceDetailsModel>> execute({
    required int maintenanceRequestID,
  }) async {
    final response = await getNetwork.getData<RepairMaintenanceDetailsModel>(
      url:
          "/api/${NetworkLinks.version}/maintenance/requests/$maintenanceRequestID",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => RepairMaintenanceDetailsModel.fromJson(json),
    );
    return response;
  }
}
