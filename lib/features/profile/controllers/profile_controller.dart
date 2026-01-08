import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renter_pay/core/data/global_models/profile_model.dart';
import 'package:renter_pay/features/home/controllers/global_scroll_controller.dart';
import 'package:renter_pay/features/profile/repositories/get_profile_repo.dart';

class ProfileController extends GetxController {
  final GetProfileRepository getProfileRepository;
  ProfileController({required this.getProfileRepository});

  final scrollController = ScrollController();
  final profileData = Rxn<ProfileModel>();
  RxBool isWebAsset = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> getProfile() async {
    final response = await getProfileRepository.execute();
    response.fold((error) => Get.snackbar("Error", error.message), (data) {
      profileData.value = data;
      nameController.text = profileData.value!.data!.name ?? "N/A";
      emailController.text = profileData.value!.data!.email ?? "N/A";
      phoneController.text = profileData.value!.data!.phone ?? "N/A";
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (!scrollController.hasClients) {
      Get.find<GlobalScrollController>().listen(scrollController);
    }
    getProfile();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
