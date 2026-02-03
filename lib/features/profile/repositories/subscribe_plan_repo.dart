import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class SubscribePlanRepository {
  final PostWithoutResponse postWithoutResponse;
  const SubscribePlanRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String role,
    required int planID,
    required int paymentMethodID,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/subscriptions/subscribe",
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {
        "role": role,
        "plan_id": planID,
        "payment_method_id": paymentMethodID,
      },
    );
    return response;
  }
}
