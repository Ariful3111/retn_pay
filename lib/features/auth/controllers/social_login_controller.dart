import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/core/services/google_auth_service.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/auth/repositories/social_login_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class SocialLoginController extends GetxController {
  final SocialLoginRepository socialLoginRepository;
  final GoogleAuthService googleAuthService;
  SocialLoginController({
    required this.socialLoginRepository,
    required this.googleAuthService,
  });

  final storageService = Get.find<StorageService>();

  Future<void> googleLogin() async {
    final token = await googleAuthService.signIn();
    if (token != null) {
      await socialLogin(
        provider: 'google',
        token: token,
        role: Get.find<UserRoleController>().getUserRole(),
      );
    }
  }

  Future<void> socialLogin({
    required String provider,
    required String token,
    required String role,
  }) async {
    final response = await socialLoginRepository.execute(
      provider: provider,
      token: token,
      role: Get.find<UserRoleController>().getUserRole(),
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        SuccessSnackbar.show(description: "Login Successful");
        final savedRole = data.data?.user?.roles?.first ?? "";
        await storageService.write(
          key: storageService.tokenKey,
          value: data.data!.token.toString(),
        );
        await storageService.write(
          key: storageService.roleKey,
          value: savedRole,
        );
        setUserIndexFromRole(savedRole);
        Get.offAllNamed(AppRoutes.mainHome);
      },
    );
  }
}
