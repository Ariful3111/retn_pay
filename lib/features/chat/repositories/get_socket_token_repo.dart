import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/chat/models/socket_token_model.dart';

class GetSocketTokenRepository {
  final PostWithResponse postWithResponse;
  const GetSocketTokenRepository({required this.postWithResponse});

  Future<Either<ErrorModel, SocketTokenModel>> execute({
    required String socketID,
    required String channelName,
  }) async {
    final response = await postWithResponse.postData<SocketTokenModel>(
      url: "/api/broadcasting/auth",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"socket_id": socketID, "channel_name": channelName},
      fromJson: (json) => SocketTokenModel.fromJson(json),
    );
    return response;
  }
}
