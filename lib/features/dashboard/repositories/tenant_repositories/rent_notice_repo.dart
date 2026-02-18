import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/rent_notice_model.dart';

class RentNoticeRepository {
  final GetNetwork getNetwork;
  const RentNoticeRepository({required this.getNetwork});

  Future<Either<ErrorModel, RentNoticeModel>> execute({required int perPage}) {
    return getNetwork.getData<RentNoticeModel>(
      url:
          "/api/${NetworkLinks.version}/rent-adjustment-notices?per_page=$perPage",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => RentNoticeModel.fromJson(json),
    );
  }
}
