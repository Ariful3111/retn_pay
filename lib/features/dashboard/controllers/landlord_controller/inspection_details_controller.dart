import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/landlord_models/inspection_details_model.dart';
import 'package:renter_pay/features/dashboard/repositories/landlord_repositories/inspection_details_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class InspectionDetailsController extends GetxController {
  final GetInspectionDetailsRepository getInspectionDetailsRepository;
  InspectionDetailsController({required this.getInspectionDetailsRepository});

  final inspectionDetails = Rxn<InspectionDetailsModel>();
  RxBool isLoading = true.obs;

  Future<void> getInspectionDetails({required String inspectionID}) async {
    final response = await getInspectionDetailsRepository.execute(
      inspectionID: inspectionID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        inspectionDetails.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getInspectionDetails(inspectionID: Get.arguments.toString());
  }
}
