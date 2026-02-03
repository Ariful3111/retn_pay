import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class FirebaseTokenUpdateRepository {
  final PostWithoutResponse postWithoutResponse;
  const FirebaseTokenUpdateRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String deviceID,
    required String firebaseToken,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/firebase-token",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
        "Device-Id": deviceID,
      },
      body: {"token": firebaseToken, "device_id": deviceID},
    );
    return response;
  }
}
