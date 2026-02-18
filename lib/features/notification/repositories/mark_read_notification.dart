import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/patch_without_response.dart';

class MarkReadNotificationRepository {
  final PatchWithoutResponse patchNetwork;
  const MarkReadNotificationRepository({required this.patchNetwork});

  Future<Either<ErrorModel, bool>> execute() async {
    final response = await patchNetwork.postData(
      url: "/api/${NetworkLinks.version}/notification/mark-all-as-read",
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
