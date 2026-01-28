import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/rent/models/property_review_model.dart';

class PropertyReviewRepository {
  final GetNetwork getNetwork;
  const PropertyReviewRepository({required this.getNetwork});

  Future<Either<ErrorModel, PropertyReviewModel>> execute({
    required String propertyID,
  }) async {
    final response = await getNetwork.getData<PropertyReviewModel>(
      url: "/api/${NetworkLinks.version}/properties/$propertyID/reviews",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PropertyReviewModel.fromJson(json),
    );
    return response;
  }
}
