import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/rent_notice_model.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/rent_notice_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class RentNoticeController extends GetxController {
  final RentNoticeRepository rentNoticeRepository;
  RentNoticeController({required this.rentNoticeRepository});

  final rentNotices = Rxn<RentNoticeModel>();
  final isLoading = true.obs;

  Future<void> getRentNotices() async {
    isLoading.value = true;
    final response = await rentNoticeRepository.execute(perPage: 15);
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        rentNotices.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getRentNotices();
  }
}
