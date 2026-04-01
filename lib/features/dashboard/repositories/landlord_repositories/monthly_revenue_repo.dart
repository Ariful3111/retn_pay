import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/monthly_revenue_model.dart';

class GetMonthlyRevenueRepository {
  final GetNetwork getNetwork;
  const GetMonthlyRevenueRepository({required this.getNetwork});

  Future<Either<ErrorModel, MonthlyRevenueModel>> execute() async {
    final response = await getNetwork.getData<MonthlyRevenueModel>(
      url: "/api/${NetworkLinks.version}/dashboard/revenue/monthly",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => MonthlyRevenueModel.fromJson(json),
    );
    return response;
  }
}
