import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/calender_model.dart';

class CalenderRepository {
  final GetNetwork getNetwork;
  const CalenderRepository({required this.getNetwork});

  Future<Either<ErrorModel, CalenderModel>> execute({
    required String startDate,
    required String endDate,
  }) async {
    final response = await getNetwork.getData<CalenderModel>(
      url:
          "/api/${NetworkLinks.version}/calendar/entries?start_date=$startDate&end_date=$endDate",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => CalenderModel.fromJson(json),
    );
    return response;
  }
}
