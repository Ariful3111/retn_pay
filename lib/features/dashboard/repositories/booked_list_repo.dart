import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/error_model.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/features/dashboard/models/booking_list_model.dart';

class BookedListRepository {
  final GetNetwork getNetwork;
  const BookedListRepository({required this.getNetwork});

  Future<Either<ErrorModel, BookingListModel>> execute({
    required String status,
    required int page,
  }) async {
    final response = await getNetwork.getData<BookingListModel>(
      url: "/api/v1/vendors/bookings?status=$status&page=$page",
      headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
      },
      fromJson: (json) => BookingListModel.fromJson(json),
    );
    return response;
  }
}
