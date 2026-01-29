import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/repositories/get_favorite_repo.dart';
import 'package:renter_pay/features/home/models/properties_model.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class GetFavoriteController extends GetxController {
  final GetFavoriteRepository getFavoriteRepository;
  GetFavoriteController({required this.getFavoriteRepository});
  final favoriteProperties = Rxn<PropertiesModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getFavorite();
  }

  Future<void> getFavorite() async {
    final response = await getFavoriteRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        favoriteProperties.value = data;
      },
    );
  }
}
