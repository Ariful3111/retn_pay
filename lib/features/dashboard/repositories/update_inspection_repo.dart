import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/update_without_response.dart';

class UpdateInspectionRepository {
  final UpdateWithoutResponse updateNetwork;
  const UpdateInspectionRepository({required this.updateNetwork});

  Future<Either<ErrorModel, bool>> execute({
    required String status,
    required int id,
  }) async {
    String url = "/api/${NetworkLinks.version}/inspections/$id";
    if (status.isNotEmpty) {
      url = "$url?status=$status";
    }
    final response = await updateNetwork.updateData(
      url: url,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"status": status},
    );
    return response;
  }
}
