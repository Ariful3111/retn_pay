import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:renter_pay/core/data/local/theme_service.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';

class DependencyInjection {
  static Future<void> init ()async {
    await GetStorage.init();
    Get.put<ThemeService>(ThemeService(),permanent: true);
    Get.put(GlobalScrollController(),permanent: true);
  }
}