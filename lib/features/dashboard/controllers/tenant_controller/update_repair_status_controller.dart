import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/repair_maintenance_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/update_repair_request_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class UpdateRepairRequestController extends GetxController {
  final UpdateRepairRequestRepository updateRepairRequestRepository;
  UpdateRepairRequestController({required this.updateRepairRequestRepository});

  final isLoading = false.obs;
  RxDouble rating = 1.0.obs;
  TextEditingController reviewController = TextEditingController();

  Future<void> updateRepairStatus({
    required String maintenanceRequestID,
    required String message,
    required String statusChange,
  }) async {
    isLoading.value = true;
    final response = await updateRepairRequestRepository.execute(
      maintenanceRequestID: maintenanceRequestID,
      message: message,
      statusChange: statusChange,
    );
    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        await Get.find<RepairMaintenanceController>().getRepairMaintenance();
        isLoading.value = false;
        Get.back();
      },
    );
  }
}
