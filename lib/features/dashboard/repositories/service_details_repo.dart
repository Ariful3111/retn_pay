import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/service_details_model.dart';

class ServiceDetailsRepository {
  final GetNetwork getNetwork;
  const ServiceDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, ServiceDetailsModel>> execute({
    required int serviceTypeID,
  }) async {
    final response = await getNetwork.getData<ServiceDetailsModel>(
      url:
          "/api/${NetworkLinks.version}/vendors/services?service_type_id=$serviceTypeID",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ServiceDetailsModel.fromJson(json),
    );
    return response;
  }
}
