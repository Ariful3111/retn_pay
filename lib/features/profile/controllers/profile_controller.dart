import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';

class ProfileController extends GetxController{
  RxBool isWebAsset = false.obs;

  void logOut(){
    Get.offAllNamed(AppRoutes.signupOption);
  }
}