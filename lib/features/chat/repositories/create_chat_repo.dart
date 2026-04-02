import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/chat/models/create_chat_model.dart';

class CreateChatRepository {
  final PostWithResponse postWithResponse;
  const CreateChatRepository({required this.postWithResponse});

  Future<Either<ErrorModel, CreateChatModel>> execute({
    required int otherUserID,
  }) async {
    final response = await postWithResponse.postData(
      url: "/api/v1/chat/conversations",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"other_user_id": otherUserID},
      fromJson: (json) => CreateChatModel.fromJson(json),
    );
    return response;
  }
}
