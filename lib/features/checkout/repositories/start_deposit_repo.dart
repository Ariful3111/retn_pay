import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/features/checkout/models/start_deposit_model.dart';

class StartDepositRepository {
  final PostWithResponse postWithoutResponse;
  const StartDepositRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, StartDepositModel>> execute({
    required double amount,
    required String currency,
    required String gateway,
  }) async {
    final response = await postWithoutResponse.postData<StartDepositModel>(
      url: "/api/${NetworkLinks.version}/payment-gateway/deposit",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {"amount": amount, "currency": currency, "gateway": gateway},
      fromJson: (json) => StartDepositModel.fromJson(json),
    );
    return response;
  }
}
