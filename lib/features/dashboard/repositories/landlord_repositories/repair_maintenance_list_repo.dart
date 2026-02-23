import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/repair_maintenance_list_model.dart';

class RepairMaintenanceListRepository {
  final GetNetwork getNetwork;
  const RepairMaintenanceListRepository({required this.getNetwork});

  Future<Either<ErrorModel, RepairMaintenanceListModel>> execute({
    required String status,
    int page = 1,
    int perPage = 20,
  }) async {
    final queryParams = <String, String>{
      'page': '$page',
      'per_page': '$perPage',
    };
    final trimmedStatus = status.trim();
    if (trimmedStatus.isNotEmpty) {
      queryParams['status'] = trimmedStatus;
    }
    final queryString = queryParams.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    final response = await getNetwork.getData<RepairMaintenanceListModel>(
      url: "/api/${NetworkLinks.version}/maintenance/requests?$queryString",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => RepairMaintenanceListModel.fromJson(json),
    );
    return response;
  }
}
