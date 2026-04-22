import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/current_plan_model.dart';

class CurrentPlanRepository {
  final GetNetwork getNetwork;
  const CurrentPlanRepository({required this.getNetwork});

  Future<Either<ErrorModel, CurrentPlanModel>> execute() async {
    final response = await getNetwork.getData<CurrentPlanModel>(
      url: "/api/${NetworkLinks.version}/subscriptions/current",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => CurrentPlanModel.fromJson(json),
    );
    return response;
  }
}
