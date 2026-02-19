import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/rent/models/rent_list_model.dart';

class GetRentListRepository {
  final GetNetwork getNetwork;
  const GetRentListRepository({required this.getNetwork});

  Future<Either<ErrorModel, RentListModel>> execute({required int page}) async {
    final response = await getNetwork.getData<RentListModel>(
      url: "/api/${NetworkLinks.version}/rent-payments?page=$page",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => RentListModel.fromJson(json),
    );
    return response;
  }
}
