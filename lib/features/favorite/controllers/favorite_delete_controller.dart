import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/features/favorite/repositories/delete_favorite_repo.dart';
import 'package:renter_pay/features/home/controllers/home_controller.dart';
import 'package:renter_pay/features/home/controllers/popular_controller.dart';
import 'package:renter_pay/features/home/controllers/recommended_controller.dart';
import 'package:renter_pay/features/rent/controllers/rent_controller.dart';
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

        // Update main properties list
        if (controller.properties.value?.data?.data != null) {
          var item = controller.properties.value!.data!.data!.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }

        // Update house properties list
        if (controller.houseProperties.isNotEmpty) {
          var item = controller.houseProperties.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }

        // Update apartment properties list
        if (controller.apartmentProperties.isNotEmpty) {
          var item = controller.apartmentProperties.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }

        // Update vila properties list
        if (controller.vilaProperties.isNotEmpty) {
          var item = controller.vilaProperties.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }

        // Update office properties list
        if (controller.officeProperties.isNotEmpty) {
          var item = controller.officeProperties.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }

        // Update studio properties list
        if (controller.studioProperties.isNotEmpty) {
          var item = controller.studioProperties.firstWhereOrNull(
            (element) => element.id == propertyID,
          );
          if (item != null) {
            item.isFavourite.value = false;
          }
        }
      }
    }

    // Update rent list properties (for rent view)
    if (Get.isRegistered<RentController>()) {
      var controller = Get.find<RentController>();
      if (controller.rents.value?.data?.data != null) {
        final dataList = controller.rents.value!.data!.data!;
        for (var rentItem in dataList) {
          if (rentItem.property?.id == propertyID) {
            rentItem.property!.isFavourite.value = false;
            break;
          }
        }
      }
    }
  }
}
