import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controllers/favorite_controller.dart';
import 'package:renter_pay/features/favorite/controllers/get_favorite_controller.dart';
import 'package:renter_pay/features/favorite/repositories/get_favorite_repo.dart';

class FavoriteBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoriteRepository(getNetwork: Get.find()));
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => GetFavoriteController(getFavoriteRepository: Get.find()));
  }
}
