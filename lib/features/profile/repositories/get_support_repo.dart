import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/profile/models/support_ticket_model.dart';

class GetSupportTicketRepository {
  final GetNetwork getNetwork;
  const GetSupportTicketRepository({required this.getNetwork});

  Future<Either<ErrorModel, SupportTicketModel>> execute({
    int page = 1,
    required int perPage,
    required String status,
  }) async {
    final response = await getNetwork.getData<SupportTicketModel>(
      url:
          "/api/v1/support-tickets?page=$page&per_page=$perPage&status=$status",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => SupportTicketModel.fromJson(json),
    );
    return response;
  }
}
