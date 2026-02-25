import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_details_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_details_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ServiceDetailsController extends GetxController {
  final ServiceDetailsRepository serviceDetailsRepository;
  ServiceDetailsController({required this.serviceDetailsRepository});

  final serviceDetails = Rxn<ServiceDetailsModel>();
  RxBool isLoading = true.obs;

  Future<void> getServiceDetails({required int serviceTypeID}) async {
    final response = await serviceDetailsRepository.execute(
      serviceTypeID: serviceTypeID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        serviceDetails.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    final serviceTypeID = Get.arguments as int;
    getServiceDetails(serviceTypeID: serviceTypeID);
  }
}
