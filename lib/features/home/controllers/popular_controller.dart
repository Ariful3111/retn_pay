import 'package:get/get.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/features/home/repositories/popular_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PopularController extends GetxController {
  final GetPopularRepository getPopularRepository;
  PopularController({required this.getPopularRepository});

  final popularProperties = Rxn<PropertiesModel>();
  RxBool isLoading = true.obs;

  Future<void> getPopular() async {
    final response = await getPopularRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        popularProperties.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getPopular();
  }
}
