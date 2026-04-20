import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/global_models/settings_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';

class AppSettingsRepository {
  final GetNetwork getNetwork;
  const AppSettingsRepository({required this.getNetwork});

  Future<Either<ErrorModel, GetSettingsModel>> execute() async {
    final response = await getNetwork.getData<GetSettingsModel>(
      url: "/api/${NetworkLinks.version}/settings/app",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => GetSettingsModel.fromJson(json),
    );
    return response;
  }
}
