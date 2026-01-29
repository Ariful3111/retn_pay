import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/blog_details_model.dart';

class GetBlogDetailsRepository {
  final GetNetwork getNetwork;
  const GetBlogDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, BlogDetailsModel>> execute({
    required String slug,
  }) async {
    final response = await getNetwork.getData<BlogDetailsModel>(
      url: "/api/${NetworkLinks.version}/blogs/$slug",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => BlogDetailsModel.fromJson(json),
    );
    return response;
  }
}
