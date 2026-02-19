import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/service_list_model.dart';
import 'package:renter_pay/features/dashboard/repositories/service_list_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class ServiceListController extends GetxController {
  final ServiceListRepository serviceListRepository;
  ServiceListController({required this.serviceListRepository});

  final services = Rxn<ServiceListModel>();
  RxBool isLoading = true.obs;

  Future<void> getServiceList() async {
    final response = await serviceListRepository.execute(status: 'active');
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        services.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getServiceList();
  }
}
