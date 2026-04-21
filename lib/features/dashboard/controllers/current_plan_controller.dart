import 'package:get/get.dart';
import 'package:renter_pay/features/dashboard/models/current_plan_model.dart';
import 'package:renter_pay/features/dashboard/repositories/current_plan_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class CurrentPlanController extends GetxController {
  final CurrentPlanRepository currentPlanRepository;
  CurrentPlanController({required this.currentPlanRepository});

  final currentPlan = Rxn<CurrentPlanModel>();
  RxBool isLoading = true.obs;

  /// Finds the first subscription with a suggested upgrade plan
  CurrentSubscription? getSubscriptionWithUpgrade() {
    final subscriptions = currentPlan.value?.data;
    if (subscriptions == null || subscriptions.isEmpty) return null;

    for (final subscription in subscriptions) {
      if (subscription.suggestedUpgradePlan != null) {
        return subscription;
      }
    }
    return null;
  }

  Future<void> getCurrentPlan() async {
    isLoading.value = true;
    final response = await currentPlanRepository.execute();
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        currentPlan.value = data;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentPlan();
  }
}
