import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/balance_model.dart';

class GetBalanceRepository {
  final GetNetwork getNetwork;
  const GetBalanceRepository({required this.getNetwork});

  Future<Either<ErrorModel, BalanceModel>> execute() async {
    final response = await getNetwork.getData<BalanceModel>(
      url: "/api/${NetworkLinks.version}/wallets/balance",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => BalanceModel.fromJson(json),
    );
    return response;
  }
}
