import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/service_vendor_models/booking_model.dart';

class GetBookingsRepository {
  final GetNetwork getNetwork;
  const GetBookingsRepository({required this.getNetwork});

  Future<Either<ErrorModel, BookingManagementModel>> execute() async {
    final response = await getNetwork.getData<BookingManagementModel>(
      url: "/api/${NetworkLinks.version}/vendors/bookings",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => BookingManagementModel.fromJson(json),
    );
    return response;
  }
}
