import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/chat/models/chat_list_model.dart';

class P2PChatListRepository {
  final GetNetwork getNetwork;
  const P2PChatListRepository({required this.getNetwork});

  Future<Either<ErrorModel, ChatListModel>> execute({required int page}) async {
    final response = await getNetwork.getData<ChatListModel>(
      url:
          "/api/${NetworkLinks.version}/chat/conversations?per_page=20&page=$page",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ChatListModel.fromJson(json),
    );
    return response;
  }
}
