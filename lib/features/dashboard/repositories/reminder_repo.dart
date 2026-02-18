import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/reminder_model.dart';

class ReminderRepository {
  final GetNetwork getNetwork;
  const ReminderRepository({required this.getNetwork});

  Future<Either<ErrorModel, ReminderModel>> execute({
    required int perPage,
  }) async {
    final response = await getNetwork.getData<ReminderModel>(
      url: "/api/${NetworkLinks.version}/reminders?per_page=$perPage",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => ReminderModel.fromJson(json),
    );
    return response;
  }
}
