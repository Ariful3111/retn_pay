import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';

class GetFavoriteRepository {
  final GetNetwork getNetwork;
  const GetFavoriteRepository({required this.getNetwork});

  Future<Either<ErrorModel, PropertiesModel>> execute() async {
    final response = await getNetwork.getData<PropertiesModel>(
      url: "/api/${NetworkLinks.version}/properties/favourites",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PropertiesModel.fromJson(json),
    );
    return response;
  }
}
