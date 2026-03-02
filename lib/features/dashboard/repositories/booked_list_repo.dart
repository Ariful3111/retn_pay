import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/networks_path.dart';
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
    String? dateFrom,
    String? dateTo,
    String? date,
  }) async {
    final query = <String, String>{
      'status': status,
      'page': page.toString(),
      if (dateFrom != null && dateFrom.isNotEmpty) 'date_from': dateFrom,
      if (dateTo != null && dateTo.isNotEmpty) 'date_to': dateTo,
      if (date != null && date.isNotEmpty) 'date': date,
    };
    final response = await getNetwork.getData<BookingListModel>(
      url:
          "/api/${NetworkLinks.version}/vendors/bookings?${Uri(queryParameters: query).query}",
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
