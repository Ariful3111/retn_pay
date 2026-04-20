import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class UpdateRepairRequestRepository {
  final PostWithoutResponse postWithoutResponse;
  const UpdateRepairRequestRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String maintenanceRequestID,
    required String message,
    required String statusChange,
  }) async {
    final response = await postWithoutResponse.postData(
      url:
          "/api/${NetworkLinks.version}/maintenance/requests/$maintenanceRequestID/updates",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"message": message, "status_change": statusChange},
    );
    return response;
  }
}
