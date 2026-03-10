import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class SendMessageRepository {
  final PostWithoutResponse postWithoutResponse;
  const SendMessageRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int conversationID,
    required String message,
  }) async {
    final response = await postWithoutResponse.postData(
      url:
          "/api/${NetworkLinks.version}/chat/conversations/$conversationID/messages",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"message": message},
    );
    return response;
  }
}
