import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/data/global_models/profile_model.dart';
import 'package:renter_pay/features/profile/controllers/profile_controller.dart';
import 'package:renter_pay/features/profile/repositories/profile_edit_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

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
  TextEditingController rentController = TextEditingController();
  TextEditingController subsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController businessLicenseController = TextEditingController();
  RxBool isPets = false.obs;
  RxBool isParking = false.obs;
  RxString initialPet = 'Pet Type'.obs;
  RxList petType = ['Dog', 'Cat'].obs;
  RxBool isSelectedPet = false.obs;
  RxBool isEdit = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ProfileModel? userProfile = Get.find<ProfileController>().profileData.value;
    nameController.text = userProfile?.data?.firstName ?? '';
    lastNameController.text = userProfile?.data?.lastName ?? '';
    emailController.text = userProfile?.data?.email ?? '';
    phoneController.text = userProfile?.data?.phone ?? '';
  }

  Future<void> updateProfile() async {
    try {
      isLoading.value = true;
      final response = await profileEditRepository.execute(
        firstName: nameController.text,
        lastName: lastNameController.text,
        // email: emailController.text,
        // phone: phoneController.text,
        // businessName: businessNameController.text,
        // businessType: businessTypeController.text,
        // abn: businessLicenseController.text,
        role:
            Get.find<ProfileController>()
                .profileData
                .value
                ?.data
                ?.roles
                ?.first ??
            '',
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (success) async {
          if (success) {
            isEdit.value = false;
            await Get.find<ProfileController>().getProfile();
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
