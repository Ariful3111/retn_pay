import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/lease_agreement_model.dart';

class LeaseAgreementRepository {
  final GetNetwork getNetwork;
  const LeaseAgreementRepository({required this.getNetwork});

  Future<Either<ErrorModel, LeaseAgreementModel>> execute({
    required int perPage,
  }) {
    return getNetwork.getData<LeaseAgreementModel>(
      url: "/api/${NetworkLinks.version}/lease-agreements",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => LeaseAgreementModel.fromJson(json),
    );
  }
}
