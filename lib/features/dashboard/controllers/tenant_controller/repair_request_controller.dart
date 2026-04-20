import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/repair_maintenance_details_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/repair_maintenance_details_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class RepairRequestController extends GetxController {
  final RepairMaintenanceDetailsRepository repairMaintenanceDetailsRepository;
  RepairRequestController({required this.repairMaintenanceDetailsRepository});

  final details = Rxn<RepairMaintenanceDetailsModel>();
  RxBool isLoading = true.obs;



  int? get maintenanceRequestId {
    final args = Get.arguments;
    if (args is int) return args;
    if (args is String) return int.tryParse(args);
    if (args is Map) {
      final raw = args['id'] ?? args['maintenanceRequestID'];
      if (raw is int) return raw;
      if (raw is String) return int.tryParse(raw);
    }
    return null;
  }

  Future<void> getRepairRequestDetails() async {
    final id = maintenanceRequestId;
    if (id == null) {
      isLoading.value = false;
      return;
    }
    isLoading.value = true;
    final response = await repairMaintenanceDetailsRepository.execute(
      maintenanceRequestID: id,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        details.value = data;
      },
    );
    isLoading.value = false;
  }


  @override
  void onInit() {
    super.onInit();
    getRepairRequestDetails();
  }
}
