import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/conditional_reports_model.dart';

class ConditionalReportsRepository {
  final GetNetwork getNetwork;
  const ConditionalReportsRepository({required this.getNetwork});

  Future<Either<ErrorModel, ConditionalReportsModel>> execute() async {
    final response = await getNetwork.getData<ConditionalReportsModel>(
      url: "/api/${NetworkLinks.version}/condition-reports",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ConditionalReportsModel.fromJson(json),
    );
    return response;
  }
}
