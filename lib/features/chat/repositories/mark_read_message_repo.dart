import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class MarkReadMessageRepository {
  final PostWithoutResponse postWithoutResponse;
  const MarkReadMessageRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int conversationID,
  }) async {
    final response = await postWithoutResponse.postData(
      url:
          "/api/${NetworkLinks.version}/chat/conversations/$conversationID/read",
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
