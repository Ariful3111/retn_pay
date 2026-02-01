import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/core/routes/app_routes.dart';
import 'package:renter_pay/features/auth/controllers/user_role_controller.dart';
import 'package:renter_pay/features/auth/repositories/register_repo.dart';
import 'package:renter_pay/features/auth/repositories/verification_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class SignupController extends GetxController {
  final VerificationRepository verificationRepository;
  final RegisterRepository registerRepository;
  SignupController({
    required this.verificationRepository,
    required this.registerRepository,
  });
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  final storage = Get.find<StorageService>();

  Future<void> sendCode({required GlobalKey<FormState> fromKey}) async {
    if (fromKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final (contact, contactType, message) = verificationIdentifier();
      final response = await verificationRepository.execute(
        contact: contact,
        contactType: contactType,
        isRegistration: 1,
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          SuccessSnackbar.show(description: message);
          Get.toNamed(AppRoutes.otpView, arguments: contactType);
        },
      );
    }
  }

  Future<void> register({
    required String phoneCode,
    required String emailCode,
  }) async {
    isLoading.value = true;

    final response = await registerRepository.execute(
      role: roleIdentifier(),
      name: nameController.text,
      phone: phoneCode.isNotEmpty ? phoneController.text : "",
      email: emailCode.isNotEmpty ? emailController.text : "",
      password: passwordController.text,
      confirmPassword: confirmPassController.text,
      phoneCode: phoneCode,
      emailCode: emailCode,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        final savedRole = data.data?.user?.roles?.first ?? roleIdentifier();
        await storage.write(
          key: storage.tokenKey,
          value: data.data!.token.toString(),
        );
        await storage.write(key: storage.roleKey, value: savedRole);
        setUserIndexFromRole(savedRole);
        SuccessSnackbar.show(description: "Registration Successful");
        navigator();
      },
    );
  }

  String roleIdentifier() {
    int index = Get.find<UserRoleController>().selectedIndex.value;
    if (index == 0) {
      return "tenant";
    } else if (index == 1) {
      return "landlord";
    } else if (index == 2) {
      return "agent";
    } else {
      return "service-vendor";
    }
  }

  (String, String, String) verificationIdentifier() {
    if (phoneController.text.isNotEmpty) {
      return (phoneController.text, "phone", "Code sended to your phone");
    } else if (emailController.text.isNotEmpty) {
      return (emailController.text, "email", "Code sended to your email");
    } else {
      return ("", "", "");
    }
  }

  void navigator() {
    int index = Get.find<UserRoleController>().selectedIndex.value;
    if (index == 0) {
      Get.offAllNamed(AppRoutes.mainHome);
    } else if (index == 1) {
      Get.toNamed(AppRoutes.documentVerification);
    } else if (index == 3) {
      Get.toNamed(AppRoutes.documentVerification);
    } else if (index == 2) {
      Get.toNamed(AppRoutes.mainHome);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
