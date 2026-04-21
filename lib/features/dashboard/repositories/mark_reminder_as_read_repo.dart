import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/patch_without_response.dart';

class MarkReminderAsReadRepository {
  final PatchWithoutResponse patchWithoutResponse;
  const MarkReminderAsReadRepository({required this.patchWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String notificationID,
  }) async {
    final response = await patchWithoutResponse.postData(
      url: "/api/v1/notification/$notificationID/mark-as-read",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {},
    );
    return response;
  }
}
