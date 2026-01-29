import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/settings_model.dart';

class GetSettingsRepository {
  final GetNetwork getNetwork;
  const GetSettingsRepository({required this.getNetwork});

  Future<Either<ErrorModel, SettingsModel>> execute() async {
    final response = await getNetwork.getData<SettingsModel>(
      url: "/api/${NetworkLinks.version}/user/settings",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => SettingsModel.fromJson(json),
    );
    return response;
  }
}
