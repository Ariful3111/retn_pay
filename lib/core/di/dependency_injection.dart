import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/local/theme_service.dart';
import 'package:renter_pay/core/data/networks/delete_network.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/core/data/networks/image_with_response.dart';
import 'package:renter_pay/core/data/networks/image_without_response.dart';
import 'package:renter_pay/core/data/networks/patch_without_response.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';
import 'package:renter_pay/core/data/networks/update_without_response.dart';
import 'package:renter_pay/core/di/firebase_initialize.dart';
import 'package:renter_pay/core/services/uuid_service.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/auth/controllers/firebase_token_update_controller.dart';
import 'package:renter_pay/features/auth/controllers/get_settings_controller.dart';
import 'package:renter_pay/features/auth/repositories/firebase_token_update_repo.dart';
import 'package:renter_pay/features/auth/repositories/get_settings_repo.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class DependencyInjection {
  static Future<String> init() async {
    await FirebaseInitialize.init();
    await GetStorage.init();
    Get.put<StorageService>(StorageService(), permanent: true);
    Get.put<UuidService>(
      UuidService(storageService: Get.find<StorageService>()),
      permanent: true,
    );
    Get.put<ThemeService>(ThemeService(), permanent: true);
    Get.put(ThemeController(), permanent: true);
    Get.put(GlobalScrollController(), permanent: true);
    Get.put(GetNetwork(), permanent: true);
    Get.put<PostWithResponse>(PostWithResponse(), permanent: true);
    Get.put<PostWithoutResponse>(PostWithoutResponse(), permanent: true);
    Get.put<PatchWithoutResponse>(PatchWithoutResponse(), permanent: true);
    Get.put<UpdateWithoutResponse>(UpdateWithoutResponse(), permanent: true);
    Get.put<DeleteNetwork>(DeleteNetwork(), permanent: true);
    Get.put<ImageWithoutResponse>(ImageWithoutResponse(), permanent: true);
    Get.put<ImageWithResponse>(ImageWithResponse(), permanent: true);
    Get.put<FirebaseTokenUpdateRepository>(
      FirebaseTokenUpdateRepository(postWithoutResponse: Get.find()),
      permanent: true,
    );
    Get.put(
      FirebaseTokenUpdateController(firebaseTokenUpdateRepository: Get.find()),
      permanent: true,
    );
    Get.put<AppSettingsRepository>(
      AppSettingsRepository(getNetwork: Get.find()),
      permanent: true,
    );
    Get.put(
      GetSettingsController(settingsRepository: Get.find()),
      permanent: true,
    );
    await Get.find<UuidService>().getUuidFromStorage();

    return Get.find<StorageService>().read(
          key: Get.find<StorageService>().tokenKey,
        ) ??
        "";
  }
}
