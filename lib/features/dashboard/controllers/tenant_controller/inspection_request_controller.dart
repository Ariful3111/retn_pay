import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/inspection_model.dart';
import 'package:renter_pay/features/dashboard/repositories/get_inspections_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class InspectionRequestController extends GetxController {
  final GetInspectionsRepository getInspectionsRepository;
  InspectionRequestController({required this.getInspectionsRepository});
  final inspections = Rxn<InspectionModel>();
  RxInt isInspectionType = 0.obs;
  RxList<int> expanded = <int>[].obs;
  final List inspectionTypeList = ['Scheduled', 'Pending', 'History'];
  final List<String> tableColumn = ['Property Address', 'Status', 'Action'];
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getInspections();
  }

  Future<void> getInspections() async {
    isLoading.value = true;
    final response = await getInspectionsRepository.execute(
      status: getInspectionStatus(status: isInspectionType.value),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        inspections.value = data;
      },
    );
  }

  void toggleExpanded({required int id}) {
    if (expanded.contains(id)) {
      expanded.remove(id);
    } else {
      expanded.add(id);
    }
  }

  String getInspectionStatus({required int status}) {
    switch (status) {
      case 0:
        return "scheduled";
      case 1:
        return "pending";
      case 2:
        return "";
      default:
        return "";
    }
  }
}
