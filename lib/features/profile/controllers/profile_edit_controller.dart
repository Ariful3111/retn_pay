import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/constants/static_datas.dart';
import 'package:renter_pay/core/data/global_models/profile_model.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/profile_edit_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class ProfileEditController extends GetxController {
  final ProfileEditRepository profileEditRepository;
  ProfileEditController({required this.profileEditRepository});

  ImagePicker picker = ImagePicker();
  Rxn<XFile> upload = Rxn<XFile>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController businessLicenseController = TextEditingController();
  RxBool isEdit = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ProfileModel? userProfile = Get.find<ProfileController>().profileData.value;
    final user = userProfile?.data;

    // Common fields for all users
    nameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = user?.phone ?? '';
    passwordController.text =
        ''; // Password should always be empty for security

    // Role-specific fields
    switch (userIndex) {
      case 3: // Service Vendor
        final vendorProfile = user?.serviceVendorProfile;
        businessNameController.text = vendorProfile?.businessName ?? '';
        businessTypeController.text = vendorProfile?.businessType ?? '';
        businessLicenseController.text = vendorProfile?.abn ?? '';
        break;

      case 2: // Agent
        final agentProfile = user?.agentProfile;
        businessNameController.text = agentProfile?.agencyName ?? '';
        businessTypeController.text = ''; // Agent doesn't have businessType
        businessLicenseController.text = agentProfile?.abn ?? '';
        break;

      default: // Landlord or Tenant
        businessNameController.text = '';
        businessTypeController.text = '';
        businessLicenseController.text = '';
        break;
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading.value = true;
      final image = upload.value != null ? File(upload.value!.path) : null;
      final response = await profileEditRepository.execute(
        image: image,
        firstName: nameController.text,
        lastName: lastNameController.text,
        // email: emailController.text,
        // phone: phoneController.text,
        businessName: businessNameController.text,
        businessType: businessTypeController.text,
        abn: businessLicenseController.text,
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (success) async {
          if (success) {
            isEdit.value = false;
            upload.value = null;
            await Get.find<ProfileController>().getProfile();
            SuccessSnackbar.show(description: 'Profile updated successfully');
          }
        },
      );
    } catch (e) {
      ErrorSnackbar.show(description: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateImage({required File image}) async {
    try {
      isLoading.value = true;

      final response = await profileEditRepository.execute(image: image);
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (success) async {
          if (success) {
            upload.value = null;
            await Get.find<ProfileController>().getProfile();
            SuccessSnackbar.show(description: 'Profile image successfully');
          }
        },
      );
    } catch (e) {
      ErrorSnackbar.show(description: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
