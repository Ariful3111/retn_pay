import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class VrController extends GetxController {
  final panoramaPath = RxnString();

  void onAllPhotosSnapped() {
    debugPrint("onAllPhotosSnapped: $panoramaPath");
    Get.back();
  }

  void onSuccess({required String path}) {
    panoramaPath.value = path;
    Get.toNamed(AppRoutes.vrViewScreen, arguments: path);
  }

  void onError({required String error}) {
    ErrorSnackbar.show(description: error);
  }
}
