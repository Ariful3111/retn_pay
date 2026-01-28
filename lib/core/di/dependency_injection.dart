import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/data/local/theme_service.dart';
import 'package:renter_pay/core/data/networks/get_network.dart';
import 'package:renter_pay/core/data/networks/patch_without_response.dart';
import 'package:renter_pay/core/data/networks/post_with_response.dart';
import 'package:renter_pay/core/data/networks/post_without_response.dart';
import 'package:renter_pay/core/themes/theme_controller.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class DependencyInjection {
  static Future<String> init() async {
    await GetStorage.init();
    Get.put<StorageService>(StorageService(), permanent: true);
    Get.put<ThemeService>(ThemeService(), permanent: true);
    Get.put(ThemeController(), permanent: true);
    Get.put(GlobalScrollController(), permanent: true);
    Get.put(GetNetwork(), permanent: true);
    Get.put<PostWithResponse>(PostWithResponse(), permanent: true);
    Get.put<PostWithoutResponse>(PostWithoutResponse(), permanent: true);
    Get.put<PatchWithoutResponse>(PatchWithoutResponse(), permanent: true);

    return Get.find<StorageService>().read(
          key: Get.find<StorageService>().tokenKey,
        ) ??
        "";
  }
}
