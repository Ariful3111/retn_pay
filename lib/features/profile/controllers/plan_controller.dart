import 'package:get/get.dart';
import 'package:renter_pay/features/profile/models/plan_model.dart';
import 'package:renter_pay/features/profile/repositories/get_plan_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PlanController extends GetxController {
  final PlanRepository planRepository;
  PlanController({required this.planRepository});
  final profileData = Rxn<PlanModel>();
  RxList<Plan> landlordPlans = <Plan>[].obs;
  RxList<Plan> agentPlans = <Plan>[].obs;
  RxList<Plan> vendorPlans = <Plan>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPlans();
  }

  Future<void> getPlans() async {
    isLoading.value = true;
    final response = await planRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        profileData.value = data;
        spiltPlans();
      },
    );
  }

  void spiltPlans() {
    landlordPlans.value =
        profileData.value?.data
            ?.where((element) => element.forRole == "landlord")
            .toList() ??
        [];
    agentPlans.value =
        profileData.value?.data
            ?.where((element) => element.forRole == "agent")
            .toList() ??
        [];
    vendorPlans.value =
        profileData.value?.data
            ?.where((element) => element.forRole == "service_vendor")
            .toList() ??
        [];
  }
}
