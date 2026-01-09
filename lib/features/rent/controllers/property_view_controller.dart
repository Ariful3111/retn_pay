import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renter_pay/core/data/local/storage_service.dart';
import 'package:renter_pay/features/rent/models/property_details_model.dart';
import 'package:renter_pay/features/rent/repositories/property_details_repo.dart';
import 'package:renter_pay/shared/widgets/snackbars/error_snackbar.dart';

class PropertyViewController extends GetxController {
  final PropertyDetailsRepository propertyDetailsRepository;
  PropertyViewController({required this.propertyDetailsRepository});
  final storage = Get.find<StorageService>();
  final propertyDetails = Rxn<PropertyDetailsModel>();
  RxBool isLoading = true.obs;

  ImagePicker picker = ImagePicker();
  Rxn<XFile> frontImage = Rxn<XFile>();
  Rxn<XFile> backImage = Rxn<XFile>();

  @override
  void onInit() {
    super.onInit();
    getPropertyDetails(propertyID: Get.arguments.toString());
  }

  Future<void> getPropertyDetails({required String propertyID}) async {
    String token = await storage.read(key: storage.tokenKey);
    final response = await propertyDetailsRepository.execute(
      token: token,
      propertyID: propertyID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        propertyDetails.value = data;
      },
    );
  }
}
