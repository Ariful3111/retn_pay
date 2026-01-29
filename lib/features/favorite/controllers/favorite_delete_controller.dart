import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/features/favorite/repositories/delete_favorite_repo.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class DeleteFavoriteController extends GetxController {
  final DeleteFavoriteRepository deleteFavoriteRepository;
  DeleteFavoriteController({required this.deleteFavoriteRepository});

  RxBool isLoading = false.obs;

  Future<void> deleteFavorite({
    required int propertyID,
    required int index,
  }) async {
    isLoading.value = true;
    updateLocalUI(index: index, propertyID: propertyID);
    final response = await deleteFavoriteRepository.execute(
      propertyID: propertyID,
    );
    isLoading.value = false;
    response.fold((error) {
      ErrorSnackbar.show(description: error.message);
    }, (data) {});
  }

  void updateLocalUI({required int index, required int propertyID}) {
    var favoriteController = Get.find<GetFavoriteController>();
    if (favoriteController.favoriteProperties.value?.data?.data != null) {
      var favItem = favoriteController.favoriteProperties.value!.data!.data!
          .firstWhereOrNull((element) => element.id == propertyID);
      if (favItem != null) {
        favItem.isFavourite.value = false;
        // Also remove from the list locally if needed, or just refresh
        favoriteController.favoriteProperties.value!.data!.data!.removeWhere(
          (element) => element.id == propertyID,
        );
        favoriteController.favoriteProperties.refresh();
      }
    }

    if (index == 0) {
      if (Get.isRegistered<RecommendedController>()) {
        var controller = Get.find<RecommendedController>();
        if (controller.recommendedProperties.value?.data?.data != null) {
          var item = controller.recommendedProperties.value!.data!.data!
              .firstWhereOrNull((element) => element.id == propertyID);
          if (item != null) {
            item.isFavourite.value = false;
          }
        }
      }
    }

    if (index == 1) {
      if (Get.isRegistered<PopularController>()) {
        var controller = Get.find<PopularController>();
        if (controller.popularProperties.value?.data?.data != null) {
          var item = controller.popularProperties.value!.data!.data!
              .firstWhereOrNull((element) => element.id == propertyID);
          if (item != null) {
            item.isFavourite.value = false;
          }
        }
      }
    }

    if (index == 2) {
      if (Get.isRegistered<HomeController>()) {
        var controller = Get.find<HomeController>();
        if (controller.properties.value?.data?.data != null) {
          var item = controller.properties.value!.data!.data!.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }
      }
    }
  }
}
