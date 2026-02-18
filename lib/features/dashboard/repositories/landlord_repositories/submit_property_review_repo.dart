import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class SubmitPropertyReviewRepository {
  final PostWithoutResponse postNetwork;
  const SubmitPropertyReviewRepository({required this.postNetwork});

  Future<Either<ErrorModel, bool>> execute({
    required int propertyID,
    required double rating,
    required String title,
    required String comment,
  }) async {
    final response = await postNetwork.postData(
      url: "/api/${NetworkLinks.version}/property-reviews",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
        "Content-Type": "application/json",
      },
      body: {
        "property_id": propertyID,
        "rating": rating,
        "title": title,
        "comment": comment,
      },
    );
    return response;
  }
}
