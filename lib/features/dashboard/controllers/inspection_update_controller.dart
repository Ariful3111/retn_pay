import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/controllers/tenant_controller/inspection_request_controller.dart';
import 'package:renter_pay/features/dashboard/repositories/update_inspection_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class InspectionUpdateController extends GetxController {
  final UpdateInspectionRepository updateInspectionRepository;
  InspectionUpdateController({required this.updateInspectionRepository});
  RxBool isLoading = false.obs;

  Future<void> updateInspection({
    required String status,
    required int id,
  }) async {
    isLoading.value = true;
    final response = await updateInspectionRepository.execute(
      status: status,
      id: id,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        final controller = Get.find<InspectionRequestController>();

        final index = controller.inspections.value?.data?.indexWhere(
          (element) => element.id == id,
        );
        if (index == -1) return;
        controller.inspections.value?.data?[index!].status = status;
        controller.inspections.refresh();
      },
    );
  }
}
