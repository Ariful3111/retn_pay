import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/tenant_models/get_agreements_model.dart';
import 'package:renter_pay/features/dashboard/repositories/tenant_repositories/get_agreements_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class GetAgreementsController extends GetxController {
  final GetAgreementsRepository getAgreementsRepository;
  GetAgreementsController({required this.getAgreementsRepository});

  final agreements = Rxn<GetAgreementsModel>();
  RxBool isLoading = true.obs;

  // Get first agreement item
  AgreementItem? get firstAgreement {
    if (agreements.value?.data?.data != null &&
        agreements.value!.data!.data!.isNotEmpty) {
      return agreements.value!.data!.data!.first;
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getAgreements();
  }

  Future<void> getAgreements() async {
    try {
      isLoading.value = true;
      final response = await getAgreementsRepository.execute();
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          agreements.value = data;
        },
      );
    } catch (e) {
      isLoading.value = false;
      ErrorSnackbar.show(description: 'Failed to load agreements');
    }
  }
}
