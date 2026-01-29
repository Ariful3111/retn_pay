import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/features/favorite/repositories/add_favorite_repo.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class AddFavoriteController extends GetxController {
  final AddFavoriteRepository addFavoriteRepository;
  AddFavoriteController({required this.addFavoriteRepository});

  RxBool isLoading = false.obs;

  Future<void> addFavorite({
    required int propertyID,
    required int index,
  }) async {
    isLoading.value = true;
    updateLocalUI(index: index, propertyID: propertyID);
    final response = await addFavoriteRepository.execute(
      propertyID: propertyID,
    );
    isLoading.value = false;
    response.fold((error) {
      ErrorSnackbar.show(description: error.message);
    }, (data) {});
  }

  void updateLocalUI({required int index, required int propertyID}) {
    if (Get.isRegistered<GetFavoriteController>()) {
      var favoriteController = Get.find<GetFavoriteController>();
      if (favoriteController.favoriteProperties.value?.data?.data != null) {
        var favItem = favoriteController.favoriteProperties.value!.data!.data!
            .firstWhereOrNull((element) => element.id == propertyID);
        if (favItem != null) {
          favItem.isFavourite.value = true;
        } else {
          // If item is not in the list, we might want to refresh the list to fetch it
          // Or we can add it manually if we have the full property object (which we don't have here easily)
          // For now, refreshing the favorite list is a safe bet if we want to show it immediately
          favoriteController.getFavorite();
        }
      }
    }

    if (index == 0) {
      if (Get.isRegistered<RecommendedController>()) {
        var controller = Get.find<RecommendedController>();
        if (controller.recommendedProperties.value?.data?.data != null) {
          var item = controller.recommendedProperties.value!.data!.data!
              .firstWhereOrNull((element) => element.id == propertyID);
          if (item != null) {
            item.isFavourite.value = true;
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
            item.isFavourite.value = true;
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
            item.isFavourite.value = true;
          }
        }
      }
    }
  }
}
