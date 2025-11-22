import 'package:get/get.dart';
import 'package:renter_pay/features/favorite/controller/favorite_controller.dart';

class FavoriteBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>FavoriteController());
  }

}