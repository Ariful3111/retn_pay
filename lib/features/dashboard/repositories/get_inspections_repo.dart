import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/inspection_model.dart';

class GetInspectionsRepository {
  final GetNetwork getNetwork;
  const GetInspectionsRepository({required this.getNetwork});

  Future<Either<ErrorModel, InspectionModel>> execute({
    required String status,
  }) async {
    String url = "/api/${NetworkLinks.version}/inspections";
    if (status.isNotEmpty) {
      url = "$url?status=$status";
    }
    final response = await getNetwork.getData<InspectionModel>(
      url: url,
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => InspectionModel.fromJson(json),
    );
    return response;
  }
}
