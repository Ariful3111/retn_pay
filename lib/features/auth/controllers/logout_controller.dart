import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/repositories/logout_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class LogoutController extends GetxController {
  final LogoutRepository logoutRepository;
  LogoutController({required this.logoutRepository});
  final storage = Get.find<StorageService>();
  RxBool isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;
      final token = await storage.read(key: storage.tokenKey);
      final response = await logoutRepository.execute(token: token);
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (success) async {
          SuccessSnackbar.show(description: "Logout successfully");
          await storage.remove(key: storage.tokenKey);
          await storage.remove(key: storage.roleKey);
          setUserIndexFromRole(null);
          Get.offAllNamed(AppRoutes.userRole);
        },
      );
    } catch (e) {
      ErrorSnackbar.show(description: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
