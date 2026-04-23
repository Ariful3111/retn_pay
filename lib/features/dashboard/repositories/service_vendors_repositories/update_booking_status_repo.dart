import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/update_without_response.dart';

class UpdateBookingStatusRepository {
  final UpdateWithoutResponse updateWithoutResponse;
  const UpdateBookingStatusRepository({required this.updateWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int serviceID,
    required String status,
    required String adminNotes,
  }) async {
    final response = await updateWithoutResponse.updateData(
      url: "/api/v1/vendors/bookings/$serviceID",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
        "Content-Type": "application/json",
      },
      body: {"status": status, "admin_notes": adminNotes},
    );
    return response;
  }
}
