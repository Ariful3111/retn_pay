import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/own_services_model.dart';

class OwnServicesRepository {
  final GetNetwork getNetwork;
  const OwnServicesRepository({required this.getNetwork});

  Future<Either<ErrorModel, OwnServicesModel>> execute() async {
    final response = await getNetwork.getData<OwnServicesModel>(
      url: "/api/${NetworkLinks.version}/additional-services/requests",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => OwnServicesModel.fromJson(json),
    );
    return response;
  }
}
