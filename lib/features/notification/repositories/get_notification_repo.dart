import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/notification/models/notification_model.dart';

class GetNotificationRepository {
  final GetNetwork getNetwork;
  const GetNotificationRepository({required this.getNetwork});

  Future<Either<ErrorModel, NotificationModel>> execute({
    required int perPage,
    required int page,
  }) async {
    final response = await getNetwork.getData<NotificationModel>(
      url: "/api/v1/notification?per_page=$perPage&page=$page",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => NotificationModel.fromJson(json),
    );
    return response;
  }
}
