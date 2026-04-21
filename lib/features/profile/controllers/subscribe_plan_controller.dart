import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/subscribe_plan_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class SubscribePlanController extends GetxController {
  final SubscribePlanRepository subscribePlanRepository;
  SubscribePlanController({required this.subscribePlanRepository});

  RxBool isLoading = false.obs;

  Future<void> subscribePlan({required int planID}) async {
    isLoading.value = true;
    final response = await subscribePlanRepository.execute(
      role: currentUserRoleForApi(),
      planID: planID,
      paymentMethodID: 1,
    );

    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        await Get.find<ProfileController>().getProfile();
        isLoading.value = false;
        SuccessSnackbar.show(description: 'Subscription successful');
        Get.toNamed(AppRoutes.mainHome);
      },
    );
  }
}
