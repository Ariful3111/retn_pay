import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';

class AddFavoriteRepository {
  final PostWithoutResponse getNetwork;
  const AddFavoriteRepository({required this.getNetwork});

  Future<Either<ErrorModel, bool>> execute({required int propertyID}) async {
    final response = await getNetwork.postData(
      url: "/api/${NetworkLinks.version}/properties/$propertyID/favourite",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      body: {},
    );
    return response;
  }
}
