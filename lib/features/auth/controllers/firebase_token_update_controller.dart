import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/services/firebase_token_service.dart';
import 'package:renter_pay/core/services/uuid_service.dart';
import 'package:renter_pay/features/auth/repositories/firebase_token_update_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class FirebaseTokenUpdateController extends GetxController {
  final FirebaseTokenUpdateRepository firebaseTokenUpdateRepository;
  FirebaseTokenUpdateController({required this.firebaseTokenUpdateRepository});
  final storage = Get.find<StorageService>();
  final uuid = Get.find<UuidService>();
  RxBool isLoading = false.obs;

  Future<void> updateToken() async {
    if (storage.read(key: storage.tokenKey) != null) {
      isLoading.value = true;
      String deviceID = await uuid.getUuidFromStorage();
      String firebaseToken = await FirebaseTokenService.getFCMToken();
      final response = await firebaseTokenUpdateRepository.execute(
        deviceID: deviceID,
        firebaseToken: firebaseToken,
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          debugPrint("Token Updated");
        },
      );
    }
  }
}
