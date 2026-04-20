import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/preference_controller.dart';
import 'package:renter_pay/features/profile/models/get_preference_model.dart';
import 'package:renter_pay/features/profile/repositories/get_preference_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class GetPreferenceController extends GetxController {
  final GetPreferenceRepository getPreferenceRepository;
  GetPreferenceController({required this.getPreferenceRepository});

  final preference = Rxn<PreferenceModel>();
  RxBool isLoading = true.obs;
    RxBool isEditAddress = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPreference();
  }

  Future<void> getPreference() async {
    final response = await getPreferenceRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        preference.value = data;
        Get.find<PreferenceController>().setValues(
          rent: '',
          subs: data.data?.preferredSuburbs?.first ?? '',
          amount: data.data?.budgetMax ?? '',
          bedroom: data.data?.maxBedrooms?.toString() ?? '',
          bathroom: data.data?.maxBathrooms?.toString() ?? '',
          pets: data.data?.petsAllowed ?? false,
          parking: false,
        );
      },
    );
  }
}
