import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/service_list_model.dart';

class ServiceListRepository {
  final GetNetwork getNetwork;
  const ServiceListRepository({required this.getNetwork});

  Future<Either<ErrorModel, ServiceListModel>> execute({
    required String status,
  }) async {
    final response = await getNetwork.getData<ServiceListModel>(
      url: "/api/v1/vendors/services",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ServiceListModel.fromJson(json),
    );
    return response;
  }
}
