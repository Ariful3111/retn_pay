import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/home/models/property_address_model.dart';

class PropertyAddressRepository {
  final GetNetwork getNetwork;
  const PropertyAddressRepository({required this.getNetwork});

  Future<Either<ErrorModel, PropertyAddressModel>> execute({
    required String query,
  }) async {
    final response = await getNetwork.getData<PropertyAddressModel>(
      url: "/api/${NetworkLinks.version}/properties/search-addresses?q=$query",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PropertyAddressModel.fromJson(json),
    );
    return response;
  }
}
