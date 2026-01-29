import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/contact_us_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class ContactUsController extends GetxController {
  final ContactUsRepository contactUsRepository;
  ContactUsController({required this.contactUsRepository});
  RxBool isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> contactUs() async {
    isLoading.value = true;
    final response = await contactUsRepository.execute(
      name: nameController.text,
      email: emailController.text.isEmpty ? "N/A" : emailController.text,
      phone: phoneController.text.isEmpty ? "N/A" : phoneController.text,
      subject: "Contact Us",
      message: messageController.text.isEmpty ? "N/A" : messageController.text,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        messageController.clear();
        SuccessSnackbar.show(description: "Your message has been sent");
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    nameController.text =
        Get.find<ProfileController>().profileData.value?.data?.name ?? '';
    emailController.text =
        Get.find<ProfileController>().profileData.value?.data?.email ?? '';
    phoneController.text =
        Get.find<ProfileController>().profileData.value?.data?.phone ?? '';
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
