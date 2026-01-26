import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/home/models/property_category_model.dart';

class PropertyCategoryRepository {
  final GetNetwork getNetwork;
  const PropertyCategoryRepository({required this.getNetwork});

  Future<Either<ErrorModel, PropertyCategoryModel>> execute() async {
    final response = await getNetwork.getData<PropertyCategoryModel>(
      url: "/api/${NetworkLinks.version}/property-types",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PropertyCategoryModel.fromJson(json),
    );
    return response;
  }
}
