import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/plan_model.dart';

class PlanRepository {
  final GetNetwork getNetwork;
  const PlanRepository({required this.getNetwork});

  Future<Either<ErrorModel, PlanModel>> execute() async {
    final response = await getNetwork.getData<PlanModel>(
      url: "/api/${NetworkLinks.version}/subscriptions/plans",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => PlanModel.fromJson(json),
    );
    return response;
  }
}
