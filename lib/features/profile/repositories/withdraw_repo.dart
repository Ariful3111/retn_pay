import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class WithdrawRepository {
  final PostWithoutResponse postWithoutResponse;
  const WithdrawRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required double amount,
    required String currency,
    required int paymentMethod,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/payment-gateway/withdraw",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {
        "amount": amount,
        "currency": currency,
        "payment_method_id": paymentMethod,
      },
    );
    return response;
  }
}
