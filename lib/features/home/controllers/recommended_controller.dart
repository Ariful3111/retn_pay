import 'package:get/get.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/repositories/recommended_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class RecommendedController extends GetxController {
  final GetRecommendedRepository getRecommendedRepository;
  RecommendedController({required this.getRecommendedRepository});

  final recommendedProperties = Rxn<PropertiesModel>();
  RxBool isLoading = true.obs;

  Future<void> getRecommended() async {
    final response = await getRecommendedRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        recommendedProperties.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getRecommended();
  }
}
