import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/chat/models/message_list_model.dart';

class GetMessagesRepository {
  final GetNetwork getNetwork;
  const GetMessagesRepository({required this.getNetwork});

  Future<Either<ErrorModel, MessageListModel>> execute({
    required int conversationID,
    required int page,
  }) async {
    final response = await getNetwork.getData<MessageListModel>(
      url: "/api/v1/chat/conversations/$conversationID/messages?page=$page",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => MessageListModel.fromJson(json),
    );
    return response;
  }
}
