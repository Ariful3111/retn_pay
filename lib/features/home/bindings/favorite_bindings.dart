import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/favorite_controller.dart';

class FavoriteBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>FavoriteController());
  }

}