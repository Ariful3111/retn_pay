import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';

class OtpController extends GetxController {
  TextEditingController emailOTPController = TextEditingController();
  TextEditingController numberOTPController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> verifyOTP(GlobalKey<FormState> fromKey) async {
    int index = Get.find<UserRoleController>().selectedIndex.value;
    if (fromKey.currentState?.validate() ?? false) {
      if (index == 0) {
        Get.toNamed(AppRoutes.mainHome);
      } else if (index == 1) {
        Get.toNamed(AppRoutes.documentVerification);
      } else if (index == 3) {
        Get.toNamed(AppRoutes.documentVerification);
      } else if (index == 2) {
        Get.toNamed(AppRoutes.mainHome);
      }
    } else {
      if (index == 0) {
      } else if (index == 1) {
        Get.toNamed(AppRoutes.documentVerification);
      } else if (index == 3) {
        Get.toNamed(AppRoutes.documentVerification);
      }
    }
  }
}
