import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/lease_agreement_model.dart';
import 'package:renter_pay/features/dashboard/repositories/lease_agreement_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class LeaseAgreementController extends GetxController {
  final LeaseAgreementRepository leaseAgreementRepository;
  LeaseAgreementController({required this.leaseAgreementRepository});

  final leaseAgreements = Rxn<LeaseAgreementModel>();
  final isLoading = true.obs;

  Future<void> getLeaseAgreements() async {
    isLoading.value = true;
    final response = await leaseAgreementRepository.execute(perPage: 15);
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        leaseAgreements.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getLeaseAgreements();
  }
}
