import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/repositories/service_vendors_repositories/update_booking_status_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class UpdateServiceStatusController extends GetxController {
  final UpdateBookingStatusRepository updateBookingStatusRepository;
  UpdateServiceStatusController({required this.updateBookingStatusRepository});

  final isLoading = false.obs;

  Future<void> updateBookingStatus({
    required int serviceID,
    required String status,
    required String adminNotes,
  }) async {
    isLoading.value = true;
    final response = await updateBookingStatusRepository.execute(
      serviceID: serviceID,
      status: status,
      adminNotes: adminNotes,
    );
    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        isLoading.value = false;
      },
    );
  }
}
