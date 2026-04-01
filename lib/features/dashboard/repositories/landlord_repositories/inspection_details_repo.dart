import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/inspection_details_model.dart';

class GetInspectionDetailsRepository {
  final GetNetwork getNetwork;
  const GetInspectionDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, InspectionDetailsModel>> execute({
    required String inspectionID,
  }) async {
    final response = await getNetwork.getData<InspectionDetailsModel>(
      url: "/api/${NetworkLinks.version}/inspections/$inspectionID",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => InspectionDetailsModel.fromJson(json),
    );
    return response;
  }
}
