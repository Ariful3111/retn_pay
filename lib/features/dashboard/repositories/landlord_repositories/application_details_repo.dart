import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/application_details_model.dart';

class ApplicationDetailsRepository {
  final GetNetwork getNetwork;
  const ApplicationDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, ApplicationDetailsModel>> execute({
    required String applicationID,
  }) async {
    final response = await getNetwork.getData<ApplicationDetailsModel>(
      url: "/api/${NetworkLinks.version}/tenants/applications/$applicationID",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ApplicationDetailsModel.fromJson(json),
    );
    return response;
  }
}
