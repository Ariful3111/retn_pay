import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/add_favorite_controller.dart';
import 'package:renter_pay/features/favorite/controllers/favorite_delete_controller.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/features/favorite/repositories/add_favorite_repo.dart';
import 'package:renter_pay/features/favorite/repositories/delete_favorite_repo.dart';
import 'package:renter_pay/features/favorite/repositories/get_favorite_repo.dart';

class FavoriteBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoriteRepository(getNetwork: Get.find()));
    Get.lazyPut(() => AddFavoriteRepository(getNetwork: Get.find()));
    Get.lazyPut(() => DeleteFavoriteRepository(deleteNetwork: Get.find()));

    Get.lazyPut(() => GetFavoriteController(getFavoriteRepository: Get.find()));
    Get.lazyPut(() => AddFavoriteController(addFavoriteRepository: Get.find()));
    Get.lazyPut(
      () => DeleteFavoriteController(deleteFavoriteRepository: Get.find()),
    );
  }
}
