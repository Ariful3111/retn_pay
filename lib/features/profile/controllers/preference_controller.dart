import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:renter_pay/features/home/controllers/property_address_controller.dart';
import 'package:renter_pay/features/home/models/property_address_model.dart';
import 'package:renter_pay/features/profile/repositories/update_preference_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';
import 'package:renter_pay/shared/widgets/snackbars/success_snackbar.dart';

class PreferenceController extends GetxController {
  final UpdatePreferenceRepository updatePreferenceRepository;
  PreferenceController({required this.updatePreferenceRepository});

  TextEditingController rentController = TextEditingController();
  TextEditingController subsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();

  final FocusNode suburbFocusNode = FocusNode();

  RxBool isPets = false.obs;
  RxBool isParking = false.obs;

  RxBool isSelectedPet = false.obs;

  RxBool showSuburbSuggestions = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    suburbFocusNode.addListener(() {
      setSuburbFocus(suburbFocusNode.hasFocus);
    });
  }

  Future<void> updatePreference() async {
    debugPrint(
      "Request: ${rentController.text}, ${[subsController.text].toString()}, ${amountController.text}, ${bedroomController.text}, ${bathroomController.text}, ${isPets.value.toString()}, ${isParking.value.toString()}",
    );
    isLoading.value = true;
    final response = await updatePreferenceRepository.execute(
      weeklyRent: rentController.text,
      preferredCity: [subsController.text],
      preferredAmount: amountController.text,
      bedroom: bedroomController.text,
      bathroom: bathroomController.text,
      isPets: isPets.value,
      isParking: isParking.value,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        SuccessSnackbar.show(description: "Preference updated");
      },
    );
  }

  TextEditingController get suburbTextController {
    if (Get.isRegistered<PropertyAddressController>()) {
      return Get.find<PropertyAddressController>().addressController;
    }
    return subsController;
  }

  void setSuburbFocus(bool hasFocus) {
    showSuburbSuggestions.value = hasFocus;
    if (!hasFocus && Get.isRegistered<PropertyAddressController>()) {
      Get.find<PropertyAddressController>().clearSuggestions();
    }
  }

  void onSuburbQueryChanged(String value) {
    subsController.text = value;
  }

  void selectSuburbSuggestion(PropertyAddress address) {
    if (!Get.isRegistered<PropertyAddressController>()) return;
    final propertyAddressController = Get.find<PropertyAddressController>();
    propertyAddressController.selectAddress(address);
    final (city, _, _) = propertyAddressController.extractFilterInfos();
    final selectedCity = (city ?? address.city ?? '').trim();
    subsController.text = selectedCity;
    showSuburbSuggestions.value = false;
  }

  @override
  void onClose() {
    suburbFocusNode.dispose();
    rentController.dispose();
    subsController.dispose();
    amountController.dispose();
    bedroomController.dispose();
    bathroomController.dispose();
    super.onClose();
  }
}
