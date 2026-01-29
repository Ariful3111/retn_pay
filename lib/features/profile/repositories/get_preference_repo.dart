import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/get_preference_model.dart';

class GetPreferenceRepository {
  final GetNetwork getNetwork;
  const GetPreferenceRepository({required this.getNetwork});

  Future<Either<ErrorModel, PreferenceModel>> execute() async {
    final response = await getNetwork.getData<PreferenceModel>(
      url: "/api/${NetworkLinks.version}/tenants/preferences",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PreferenceModel.fromJson(json),
    );
    return response;
  }
}
