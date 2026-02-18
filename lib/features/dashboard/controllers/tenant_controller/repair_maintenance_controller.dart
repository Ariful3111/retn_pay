import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/repair_maintenance_model.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/repair_maintenance_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class RepairMaintenanceController extends GetxController {
  final RepairMaintenanceRepository repairMaintenanceRepository;
  RepairMaintenanceController({required this.repairMaintenanceRepository});
  final maintenances = Rxn<RepairMaintenanceModel>();
  RxInt repairTypeIndex = 0.obs;
  final List<String> repairType = ['Active', 'Complete'];
  final List<String> repairColumn = ['Issue ', 'Status', 'Action'];
  RxList<bool> expandedData = <bool>[].obs;
  RxBool isLoading = true.obs;

  List<RepairMaintenanceRequest> get requests =>
      maintenances.value?.data?.data ?? [];

  Future<void> getRepairMaintenance() async {
    isLoading.value = true;
    final status = repairTypeIndex.value == 1 ? 'completed' : null;
    final response = await repairMaintenanceRepository.execute(status: status);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        maintenances.value = data;
        expandedData.assignAll(List<bool>.filled(requests.length, false));
      },
    );
  }

  void showExpandedData(int index) {
    if (index >= 0 && index < expandedData.length) {
      expandedData[index] = !expandedData[index];
    }
    expandedData.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    getRepairMaintenance();
  }
}
