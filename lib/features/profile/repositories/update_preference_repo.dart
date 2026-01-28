import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class UpdatePreferenceRepository {
  final PostWithoutResponse postWithoutResponse;
  const UpdatePreferenceRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String weeklyRent,
    required List<String> preferredCity,
    required String preferredAmount,
    required String bedroom,
    required String bathroom,
    required bool isPets,
    required bool isParking,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/${NetworkLinks.version}/tenants/preferences",
      headers: {
        // "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {
        "weekly_rent": weeklyRent,
        "parking_allowed": isParking,
        "budget_max": preferredAmount,
        "preferred_suburbs": preferredCity,
        "pets_allowed": isPets,
        "max_bedrooms": bedroom,
        "max_bathrooms": bathroom,
      },
    );
    return response;
  }
}
