import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/blogs_model.dart';

class GetBlogRepository {
  final GetNetwork getNetwork;
  const GetBlogRepository({required this.getNetwork});

  Future<Either<ErrorModel, BlogsModel>> execute({int page = 1, int perPage = 20}) async {
    final response = await getNetwork.getData<BlogsModel>(
      url: "/api/${NetworkLinks.version}/blogs?page=$page&per_page=$perPage",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => BlogsModel.fromJson(json),
    );
    return response;
  }
}
